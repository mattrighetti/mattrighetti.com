#!/bin/bash

format_date() {
    date +"%Y-%m-%d"
}

create_jekyll_post() {
    local title="$1"
    local date
    date=$(format_date)
    local filename
    filename="${date}-$(echo "$title" | tr ' ' '-' | tr '[:upper:]' '[:lower:]').md"
    local filepath="_posts/$filename"

    local front_matter="---
title: \"$title\"
date: $(date --iso-8601=seconds)
---
"

    echo -e "$front_matter" > "$filepath"
    echo "New post created: $filepath"
}

if [ -z "$1" ]; then
    echo "Usage: $0 \"Post Title\""
    exit 1
fi

# Create the Jekyll post
create_jekyll_post "$1"
