===============================================
Backing up Data to DreamObjects Using Duplicity
===============================================

I’m setting up backups for a Linux machine in this tutorial. First
you will need to setup a plan for DreamObjects; if you already
have an account with us you can do so from the panel here, otherwise you can
signup and then head over to the panel. Once you have a plan you will want to
create a user, and after submitting a user name you’ll have to periodically
refresh the page to see if it is now available. Now once you have a
DreamObjects user you will want to click the “1 keys” button on the right side
and copy down the user key, followed by revealing the secret key and copying
that.

On Ubuntu getting all of the software you need is easy:

.. code-block:: bash

    sudo apt-get install duplicity python-boto

Now we have to take our user and secret key and put them into a file named
‘.boto’ in our users home directory. You can do this with the following
commands if you substitute your own keys:

.. code-block:: bash

    echo “[Credentials]” >> ~/.boto
    echo “aws_access_key_id = 98F3n8qUtWEJ6ZdBYyQy” >> ~/.boto
    echo “aws_secret_access_key = p5kptXKQrsQtTNJTYtG7emGYooXkN6Kaza1OV-_s” >>
    ~/.boto

Now you can backup any directory you desire to a bucket name of your choice. In
this example I’m backing up my Pictures directory to the blogdemo bucket:


.. code-block:: bash

    duplicity –allow-source-mismatch ~/Pictures \
    s3://objects.dreamhost.com/blogdemo

It prompts for a encryption password which you won’t want to forget and then
syncs your files, the output should look something like this:

.. code-block:: bash

    GnuPG passphrase:
    Retype passphrase to confirm:
    No signatures found, switching to full backup.
    ————–[ Backup Statistics ]————–
    StartTime 1356046824.18 (Thu Dec 20 15:40:24 2012)
    EndTime 1356046824.20 (Thu Dec 20 15:40:24 2012)
    ElapsedTime 0.02 (0.02 seconds)
    SourceFiles 10
    SourceFileSize 374 (374 bytes)
    NewFiles 10
    NewFileSize 374 (374 bytes)
    DeletedFiles 0
    ChangedFiles 0
    ChangedFileSize 0 (0 bytes)
    ChangedDeltaSize 0 (0 bytes)
    DeltaEntries 10
    RawDeltaSize 0 (0 bytes)
    TotalDestinationSizeChange 295 (295 bytes)
    Errors 0
    —————————————————

That’s it! You’ll want to run this command whenever you want to update your
backups. I prefer to run it manually when I’m importing pictures but it
wouldn’t be difficult to configure Cron to automatically backup a directory on
your computer.

