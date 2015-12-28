===================================
Upload Screen Shots to DreamObjects
===================================

The script is on github and was written to work on Mac OS. I will be running it
on Linux, which takes some modifications to make work and I will show you how
to do that. Download the code from
https://github.com/dreamhost/screencaps

Getting Setup
-------------
The code is written in Python and requires the boto library to connect to
DreamObjects.  You can install boto by opening the Terminal and typing:

.. code-block:: bash

    pip install boto

If you get an error typing the message above, -bash: pip: command not found
then you do not have pip installed on your system.  You can type this in the
Terminal instead to install it on Ubuntu (it will require an admin password):

.. code-block:: bash

    sudo apt-get install python-boto

You will also need a program to take the screenshot. I use ``scrot``. To
install scrot on Ubuntu run the command below.

.. code-block:: bash

    sudo apt-get install scrot

Installation
------------
If you don’t have one already, create a folder called bin in your home
directory and copy dhdo-screencap.py file into it.
Open dhdo-screencapy.py with a text editor and paste in your DreamObjects
Access Key, Secret Key and bucket name (ensure each of these are
surrounded by single quotes). If you are running the script on Linux you
will need to change some things, such as set the program that will take the screenshot

.. code-block:: python

    result = subprocess.call(['screencapture', '-i', f.name])

should be

.. code-block:: python

    result = subprocess.call(['scrot', f.name])

The above code is equivalent to running the following command in a shell.

.. code-block:: bash

    scrot filename.png

Save and close it. Now you can run the script and it will take a screenshot and upload
it to the bucket you specified. It is a good idea to assign this to a keyboard shortcut.
How you do this depends on what desktop environment or window manager you
use. Google for instructions that are specific to what you are using.

.. meta::
    :labels: python boto
