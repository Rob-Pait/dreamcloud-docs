#!/bin/bash

files="`find ./source/dream* -iname *.rst | xargs -I FILE grep -L ':labels:' FILE`"

if [ -z "$files" ] ; then
    echo "All articles have labels"
    exit 0
else
    for file in $files ; do
        echo "$file"
    done

    echo "The above files have missing labels"
    exit 1
fi
