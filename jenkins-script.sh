#! /bin/bash

# Build the documentation
tox

# Clone the publish script
git clone https://github.com/dreamhost/zendesk-publish-script.git

# create a venv to run the publishing script
virtualenv venv ; . venv/bin/activate ; pip install -r zendesk-publish-script/requirements.txt

# Get all the files that have changed since the last time the script published
# to zendesk
files="`git diff --name-only $GIT_PREVIOUS_SUCCESSFUL_COMMIT $GIT_COMMIT`"

for file in $files ; do
    if [ -e "$file" ] ; then
        # if the file extension is .rst and it is not "index.rst", get the
        # location it built to and publish it to the section specified in the
        # file "section_id.txt" in the rst file's directory
        if `echo "$file" | egrep '\.rst$' > /dev/null` && ! `echo "$file" | egrep '\/index\.rst$' > /dev/null` ; then
            html_file="`echo $file | sed 's/^source\(.*\).rst$/build\/html\1\.html/'`"
            echo "$html_file"
            dir="`dirname $file`"
            section_id="`cat ${dir}/section_id.txt`"
            python zendesk-publish-script/publish.py "$html_file" "$section_id"
        fi
    fi
done
