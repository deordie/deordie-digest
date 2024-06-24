#!/usr/bin/env bash

#############################################################################################
# This script generates post content based on issue number.                                 #
# Make sure issue is filled properly including: title, url, review and labels.              #
#                                                                                           #
# Usage:                                                                                    #
# ./post_gen.sh 20               # generates post for milestone #20 with title "Undefined"  #
# ./post_gen.sh 20 "Cool title"  # generates post for milestone #20 with title "Cool title" #
#                                                                                           #
# Script prerequisites:                                                                     #
# - gh (https://cli.github.com/)                                                            #
# - jq (https://stedolan.github.io/jq/)                                                     #
# - sed (https://www.gnu.org/software/sed/manual/sed.html)                                  #
#############################################################################################


########################################
# Constants and arguments              #
########################################
if [ $# -eq 0 ]; then
    echo "You must provide the milestone number"
    exit 1
fi

REPO="deordie/deordie-digest"
DATE=$(date "+%Y-%m-%d")
DIR=$(cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P)
MILESTONE=$1
TITLE=${2:-Undefined}


########################################
# User-defined functions               #
########################################
trim() {
    while read -r text; do
        echo "$text" | sed "s/^[\| ]*//;s/[\| ]*$//"
    done
}

wrap() {
    while read -r label; do
        echo "$1"["$label"]
    done
}


########################################
# Get issues from GitHub               #
########################################
mapfile -t issues < <(gh issue list --state all --json number,milestone --jq ".[] | select(.milestone.number == $MILESTONE) | .number" --repo $REPO | sort -n)
mapfile -t labels < <(gh issue list --state all --json milestone,labels --jq ".[] | select(.milestone.number == $MILESTONE) | .labels[].name"  --repo $REPO | sort -u | wrap)
echo "Issues to be added: " "${issues[@]}"


########################################
# Process tags and topics              #
########################################
declare -A tags

while read -r line; do
    tag=$(echo "$line" | sed "s/: *https:\/\/.\+$//")
    desc=$(echo "$line" | sed "s/^.\+https:\/\/.\+ \"topic: *//"  | sed "s/\"//")
    tags[$tag]=$desc
done < <(grep "^\[topic" < "$DIR"/../_includes/tags.md)

post_tags=()
post_topics=()

while read -r label; do
    new_tag=$(echo "$label" | sed "s/\[topic://;s/\]//")
    post_tags+=("$new_tag")
    post_topics+=("${tags[$label]},")
done < <(printf "%s\n" "${labels[@]}" | grep "^\[topic")


########################################
# Create file with header              #
########################################
digest_title=${TITLE^}
digest_title=${digest_title// /_}

topics_line=${post_topics[*]}
topics_line=${topics_line%?}
topics_line=${topics_line^}

filename="${DIR}/../_posts/${DATE}-${MILESTONE}_${digest_title}.md"

cat <<EOF > "$filename"
---
layout: post
title: "#${MILESTONE}. ${TITLE^}"
tags: ${post_tags[*]}
---

*Topics: $topics_line*

<!--cut-->

EOF

########################################
# Generate body                        #
########################################
for number in "${issues[@]}"; do
    echo "Start processing issue #$number..."

    issue=$(gh issue view "$number" --json title,body,labels --repo $REPO)

    raw_title=$(echo "$issue" | jq -r ".title")

    raw_body=$(echo "$issue" | jq ".body" | sed "s/\\\r//g" | sed "s/\\\n/|/g" | sed "s/__Created by:__ DE or DIE Bot.*//g")
    raw_body=${raw_body:1}
    raw_body=${raw_body%?}

    title=$(echo "${raw_title%/*}" | sed "s/^[ \t]*//;s/[ \t]*$//")
    author=$(echo "${raw_title#*/}" | sed "s/^[ \t]*//;s/[ \t]*$//")

    url=$(echo "$raw_body" | sed "s/^.*__URL:__//" | sed "s/__Review.*$//" | trim)
    review=$(echo "$raw_body" | sed "s/^.*__//g" | trim | sed "s/||/|/g" | sed "s/|/\n/g")

    mapfile -t issue_labels < <(echo "$issue" | jq -r ".labels[].name" | sort | wrap !)

    cat <<EOF >> "$filename"
---

[$title]($url) — $author

*$review*

${issue_labels[@]}

EOF

    echo "Issue #$number was added to the file."
done


########################################
# Generate footer                      #
########################################
cat <<EOF >> "$filename"
---

{% include tags.md %}
EOF

echo "Done."
