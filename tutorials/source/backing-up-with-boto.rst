========================================
Simple Website Backups with DreamObjects
========================================

We've talked a lot about the benefits of DreamObjects and a few ways to use it
for media file storage and computer backups.  We've also talked about
integrating it into WordPress using the DreamObjects plugin.  Using a little
bit of programming you can use it for much more than that, though.
DreamObjects is very simple to integrate into software.  In fact, it's easier
to use DreamObjects to store and access data than it is to access standard
files!  In this tutorial I'll walk you through writing a short python script
that will create a backup of your DreamHost-hosted website and then setting it
up to run automatically every day.

This script will make a complete backup of your website and all of the content
stored under it.  It won't back up your databases in this version but you could
extend it to do that as well.  Using this, you will have backups that you can
access yourself at any time if you need to restore a file.  For simplicity I'm
showing an example of keeping 7 daily backups but this general approach can be
used for any amount of backups with any schedule you like.

One I Prepared Earlier
~~~~~~~~~~~~~~~~~~~~~~
If you're the type of person that likes to jump right in, you can just download
my version of this script and go town with it.  It's here in github: Download
link (github?)

My version of the script is a little bit different than what you'll end up with
if you follow this tutorial and I'll explain how it's different later on.

The Steps
~~~~~~~~~
* First, we'll set up a DreamObjects account and a bucket to store the backups.
* Next, we'll write the python backup script step by step.
* Finally, we'll add a cron job in the DreamHost Control Panel to make the
backup script run daily.

I'll provide a finished version of the script for you to download at the
end, but it'll be more fun if you follow along with me yourself!

Set Up DreamObjects and Create a Bucket
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**TODO**
Yep, go to panel, do it.  Link to wiki.
http://wiki.dreamhost.com/DreamObjects_End_User_Guide#Users
http://wiki.dreamhost.com/DreamObjects_End_User_Guide#Buckets

Piecing Together the Backup Script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
For this script we'll be using a popular scripting language called Python
and a library of code called boto.  Boto provides the magic to communicate
with DreamObjects.  Boto needs a tiny bit of setup before we begin.  You'll
only have to do this once.

Brief Setup
-----------
We'll be creating a file called ".boto" (note the leading dot) in the home
directory of the user your website is hosted under.  Follow the
instructions found on the boto wiki article to create the configuration
file and set the permissions properly, then proceed to the next step.
http://wiki.dreamhost.com/Boto

The Script
----------
Name the script anything you like with ".py" at the end.  Then, the very
first line of your script must be this:

.. code-block:: python

    #!/usr/bin/python

Once you have your script file, make it executable so it can be run.  The
easiest way to do that is to run "chmod a+x SCRIPT_NAME".

Ok, let's get going.  Our script will have four main sections:
* Setup
* Creating the backup file
* Uploading the backup file to DreamObjects
* Clean up

Setup
-----
This part of the script consists of defining a few variables (yours
will be different from mine) and making sure everything is ready to
go for the backup itself.

First,  define some variables we know we'll need later:

.. code-block:: python

    tmp_dir = 'tmp'
    backup_bucket = 'website-backup'
    target_dir = 'idallas.com'

Here's what they will all be used for:
* *tmp_dir* defines where we will temporarily store our backup file.
* *backup_bucket* defines the bucket name where we will be storing
our backups.  You need to first create the bucket and it has to
be uniquely named so you'll have to use something more creative
than "website-backup".
* *target_dir* defines the name of the directory we want to use
as the basis for our backups.  In this example I'm assuming
it's just your website directory.  If you have more than one
website, I'll talk about how to manage that best a bit later
on.

Create the backup file
----------------------
Now it's time for our code to do some actual work.  The backup
file itself will be something called a "tar file" or  a
"tarball".  If you're not familiar with it, think of it as
something like a zip file.  Here's our code:

.. code-block:: python

    import tarfile

    tar = tarfile.open(backup_filepath, "w:gz")
    tar.add(target_dir)
    tar.close()

That's it!  First we tell Python we want to import or use the
"tarfile" code library.  Next we create the tar file itself, add
our website to it (defined earlier as "target_dir") and then
close it.  We never actually defined that "backup_filepath"
variable I've used there, though.  Here's how we can do that
(this code goes in the script before the tarfile code above):

.. code-block:: python

    import datetime
    day_number = datetime.datetime.today().weekday()

    backup_filename = target_dir + '.backup.' + str(day_number) +
    '.tar.gz'
    backup_filepath = home_dir + '/' + tmp_dir + '/' +
    backup_filename

Let's step through that.  In this simple example we're going to
keep 7 daily backups, each day overwriting the backup from one
week previous.  This bit of code defines a name and location for
the backup file we'll be creating.

* First, we're using the datetime library to figure out what day
of the week today is, as a number.  Sunday is 0,  Monday is 1,
Thursday is 4, etc.  We put that number into the "day_number"
variable.
* Next, we define the file name for our backup file to be
something like "idallas.com.backup.4.tar.gz".  That's what
that backup_filename line works out to (on Thursdays).
* Then, we define the full path to the backup file.

Upload the backup file to DreamObjects
--------------------------------------
Now that we have created a backup file, let's copy it to
DreamObjects for safe-keeping.  Here's the fun part!

First, open a connection to DreamObjects:

.. code-block:: python

    connection = boto.connect_s3( host='objects.dreamhost.com' )

That's only a single line because we already defined the
access key and secret key in our .boto file earlier.

Next, upload the tarfile to DreamObjects:

.. code-block:: python

    bucket = connection.get_bucket(backup_bucket)
    key = bucket.new_key(backup_filename)
    key.set_contents_from_file(open(backup_filepath, 'rb'))

The first line of this code defines the bucket we want to use
with DreamObjects ("backup_bucket").  The second line creates
the object  in DreamObjects with the name we defined earlier
("backup_filename"). Finally the third line sends the file
stored locally ("backup_filepath") up to DreamObjects.  And
we're done!

Clean up
--------
At this point, we still have a backup file sitting around on
our hosting server, where it doesn't belong.  Get rid of it
like this:

.. code-block:: python

    import os
    os.remove(backup_filepath)

A few things we missed
----------------------
If you've been following along to this point you have almost
working code, but not quite.  First it assumes it is being
run from the root of your home directory, second we used a
variable called "home_dir" that we never defined, and third
it requires that you manually create the temp directory you
defined.  We've got code to help with all of that, too!

This will make sure it's running from your home directory,
defining our home_dir variable in the process:

.. code-block:: python

    home_dir = os.getenv('HOME')
    os.chdir(home_dir)

That code need to go somewhere before we use the home_dir
variable the first time.

This will create our temp directory for us if it doesn't
exist already:

.. code-block:: python

    if not os.path.isdir(tmp_dir):
    os.makedirs(tmp_dir)

In my version I've also added comments to make it easier
to read and added print statements telling us what step
it's on to make it more user friendly.

One I Prepared Earlier
----------------------
Download link.

In my final version I

Additional comments on what's different (takes target_dir
from command line to make multiple sites/directories
easier)

Test it first, then go on to the cron job step.

The Cron Job
------------
A cron job is just a request to the system to execute a
specific command on a schedule.  This is very easy to
set up from DreamHost Control Panel.

wiki link, with screenshot of mine.    **TODO**


Next Steps
----------
If you've followed all of these steps, your website (or
websites) will now be automatically backed up to
DreamObjects daily, but what if you want to do more
with those backups?  In a future post, I'll talk about
how to list your available backups and choose one to
restore from.
