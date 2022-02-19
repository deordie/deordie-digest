#!/usr/bin/env bash

###############################################################################
# This script generates post content based on issue number.                   #
# Make sure issue is filled properly including: title, url, review and labels.# 
#                                                                             #
# Script prerequisites:                                                       #
# - gh (https://cli.github.com/)                                              #
# - jq (https://stedolan.github.io/jq/)                                       #
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
echo "Issues to be added: ${issues[@]}"


########################################
# Create file with header              #
########################################
filename="./_posts/${DATE}-${MILESTONE}_$(sed 's/ /_/g' <<< ${TITLE^}).md"

cat <<EOF > $filename
---
layout: post
title: "#${MILESTONE}. ${TITLE^}"
tags:
---

*Topics: *

<!--cut-->
EOF

topics=()

########################################
# Generate body                        #
########################################
for number in "${issues[@]}"
do
    issue=$(gh issue view $number --json title,body,labels --repo $REPO)
#     issue='{
#   "body": "__URL:__ https://barrmoses.medium.com/stop-treating-your-data-engineer-like-a-data-catalog-14ed3eacf646\r\n\r\n__Review (1-2 sentences):__ Data engineers are not data catalogs! That says it all. There is a small guide on how to make dream come true.\r\n",
#   "body2": "__URL:__ https://url\r\n\r\n__Review (1-2 sentences):__ Data.\r\nasdf hdsjf\r\n\r\n\r\nhax\r\n",
#   "labels": [
#     {
#       "id": "MDU6TGFiZWwyOTE0NTEwNDQ4",
#       "name": "level:medium",
#       "description": "",
#       "color": "1d76db"
#     },
#     {
#       "id": "MDU6TGFiZWwyOTM0NTY2NTE3",
#       "name": "topic:culture",
#       "description": "",
#       "color": "07D20A"
#     }
#   ],
#   "title": "Stop Treating Your Data Engineer Like a Data Catalog /  Barr Moses @ Medium "
# }'
    raw_title=$(echo $issue | jq -r ".title")
    raw_body=$(echo $issue | jq -r ".body" | sed "s/\\r/|/g")

    title=$(echo ${raw_title%/*} | sed "s/^[ \t]*//;s/[ \t]*$//")
    author=$(echo ${raw_title#*/} | sed "s/^[ \t]*//;s/[ \t]*$//")

    url=$(echo $raw_body | sed "s/^.*__URL:__//" | sed "s/__Review.*$//" | trim)
    review=$(echo $raw_body | sed "s/^.*__//g" | trim | sed "s/|/\r\n/g")

    labels=($(echo $issue | jq -r ".labels[].name" | sort | wrap))

    cat <<EOF >> $filename

---

[$title]($url) — $author

*$review*

${labels[@]}

EOF

    topics=("${topics[@]}" )

done


########################################
# Generate footer                      #
########################################
cat <<EOF >> $filename
{% include tags.md %}
EOF
