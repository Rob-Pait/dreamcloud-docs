#!/bin/bash

if [ "$1" == "-h" -o "$1" == "--help" ] ; then
    echo "This script is used to convert html into mediawiki format
the parent directory is passed in as \$1 and must have a directory
named \"html\" inside of it."
    exit
fi

dir="$1"

# Check if there is a "html" directory in the directory the user
# submits. If there is convert all of the .html files in it to
# mediawiki. If there isn't, tell the user nothing was done and quit.
if [ -d "$dir"/html ]; then

    # Make a "mediawiki" directory for the converted files, if it
    # already exists, delete it and create it again.
    if ! `mkdir "$dir"/mediawiki 2> /dev/null` ; then
        rm -r "$dir"/mediawiki/
        mkdir "$dir"/mediawiki
    fi

    # Loop through the files and convert html to mediawiki
    for file in "$dir"/html/*.html; do
        dest=`echo $file | sed -- 's/.*\/html\///' | sed 's/.html$/.mediawiki/'`

        # Get the line number where the sidebar starts.
        lastlinenum=$((`grep -n "<div class=\"sphinxsidebar\"" "$file" | cut -d ':' -f1`-1))

        # Cut everything from the start of the sidebar to the end of the file
        # out of the file.
        finalhtml=`cat "$file" | head -n $lastlinenum`

        # Put the html without the sidebar through pandoc so that it can
        # convert it to mediawiki format.
        if `echo "$finalhtml" | pandoc -f html -t mediawiki > "${dir}/mediawiki/$dest"` ; then
            echo -e "[[Category:DreamCompute]]\n[[Category:Cloud]]\n© OpenStack Foundation, DreamHost " >> "${dir}/mediawiki/$dest"
            echo "${dir}/mediawiki/$dest"
        else
            echo "${dir}/mediawiki/$dest failed to be converted"
        fi
    done

# Error message if there is no "html" dir in the directory that the
# user submitted.
else
    echo "The dir you are trying to convert to media wiki does not
have a \"html\" directory in it. Cannot find html to convert"
fi
