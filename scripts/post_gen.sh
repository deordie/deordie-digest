#!/usr/bin/env bash

###############################################################################
# This script generates post content based on issue number.                   #
# Make sure issue is filled properly including: title, url, review and labels.# 
#                                                                             #
# Script prerequisites:                                                       #
# - gh (https://cli.github.com/)                                              #
# - jq (https://stedolan.github.io/jq/)                                       #
# - sed (https://www.gnu.org/software/sed/manual/sed.html)                    #
###############################################################################


########################################
# Constants and arguments              #
########################################
REPO="deordie/deordie-digest"
DATE=$(date "+%Y-%m-%d")
MILESTONE=$1
TITLE=${2:-Undefined}


########################################
# User-defined functions               #
########################################
trim() {
    while read text; do
        echo $text | sed "s/^[\| ]*//;s/[\| ]*$//"
    done
}

wrap() {
    while read label; do
        echo [$label]
    done
}


########################################
# Get issues from GitHub               #
########################################
issues=($(gh issue list --state all --json number,milestone --jq ".[] | select(.milestone.number == $MILESTONE) | .number" --repo $REPO | sort -n))
labels=($(gh issue list --state all --json milestone,labels --jq ".[] | select(.milestone.number == 18) | .labels[].name"  --repo $REPO | sort -u | wrap))
echo "Issues to be added: ${issues[@]}"


########################################
# Process tags and topics              #
########################################
declare -A tags

while read line; do
    tag=$(echo $line | sed "s/: *https:\/\/.\+$//")
    desc=$(echo $line | sed "s/^.\+https:\/\/.\+ \"topic: *//"  | sed "s/\"//")
    tags[$tag]=$desc
done <<< $(cat $(dirname $0)/../_includes/tags.md | grep "^\[topic")

post_tags=()
post_topics=()

while read label; do
    post_tags+=($(echo $label | sed "s/\[topic://" | sed "s/\]//"))
    post_topics+=(${tags[$label]},)
done <<< $(printf "%s\n" "${labels[@]}" | grep "^\[topic")

########################################
# Create file with header              #
########################################
filename="./_posts/${DATE}-${MILESTONE}_$(sed 's/ /_/g' <<< ${TITLE^}).md"

cat <<EOF > $filename
---
layout: post
title: "#${MILESTONE}. ${TITLE^}"
tags: ${post_tags[@]}
---

*Topics: $(echo ${post_topics[@]^} | sed "s/,$//")*

<!--cut-->
EOF


########################################
# Generate body                        #
########################################
for number in "${issues[@]}"; do
    issue=$(gh issue view $number --json title,body,labels --repo $REPO)
    raw_title=$(echo $issue | jq -r ".title")
    raw_body=$(echo $issue | jq -r ".body" | sed "s/\\r/|/g")

    title=$(echo ${raw_title%/*} | sed "s/^[ \t]*//;s/[ \t]*$//")
    author=$(echo ${raw_title#*/} | sed "s/^[ \t]*//;s/[ \t]*$//")

    url=$(echo $raw_body | sed "s/^.*__URL:__//" | sed "s/__Review.*$//" | trim)
    review=$(echo $raw_body | sed "s/^.*__//g" | trim | sed "s/|/\r\n/g")

    issue_labels=($(echo $issue | jq -r ".labels[].name" | sort | wrap))

    cat <<EOF >> $filename

---

[$title]($url) — $author

*$review*

${issue_labels[@]}

EOF

done


########################################
# Generate footer                      #
########################################
cat <<EOF >> $filename
{% include tags.md %}
EOF
