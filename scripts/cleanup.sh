#!/usr/bin/env bash

#############################################################################################
# This script close all issues included to the digest, close milestone,                     #
# and created the next one.                                                                 #
#                                                                                           #
# Usage:                                                                                    #
# ./cleanup.sh 20  # cleanup milestone #20                                                  #
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
WEB="https://digest.deordie.org"
DIR=$(cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P)
MILESTONE=$1

########################################
# Build digest url                     #
########################################
title=$(find "$DIR/../_posts/" -type f -name "*-${MILESTONE}_*" | tail -1 | sed -E "s/^.+-(${MILESTONE}_.+).md/\1/")
if [ -z "$title" ]; then
    echo "No post found for milestone $MILESTONE"
    exit 1
fi
verbose_title=$(echo "$title" | sed -E "s/^${MILESTONE}_//" | sed "s/_/ /g")
url="$WEB/$title/"

########################################
# Process issues from GitHub           #
########################################
mapfile -t issues < <(gh issue list --state all --json number,milestone --jq ".[] | select(.milestone.number == $MILESTONE) | .number" --repo $REPO | sort -n)
echo "Issues to be closed: " "${issues[@]}"

for number in "${issues[@]}"; do
    echo "Closing #$number..."
    gh issue comment "$number" --body "Published in Digest [#$MILESTONE]($url)." --repo $REPO
    gh issue close "$number" --repo $REPO 
done

###################################################
# Closing the milestone and creating the next one #
###################################################
gh api \
    --method PATCH \
    -H "Accept: application/vnd.github.v3+json" \
    repos/$REPO/milestones/"$MILESTONE" \
    -f state="closed" \
    -f title="Digest #$MILESTONE. $verbose_title" \
    -f description="Data Engineering Digest [#$MILESTONE]($url)." \
    >/dev/null

new_milestone=$((10#$MILESTONE+1))
new_date=$(date -d "+14 days" "+%Y-%m-%dT23:59:59Z")

gh api \
    --method POST \
    -H "Accept: application/vnd.github.v3+json" \
    repos/$REPO/milestones \
    -f title="Digest #$new_milestone" \
    -f state="open" \
    -f description="Call for papers." \
    -f due_on="$new_date" \
    >/dev/null

echo "Done."