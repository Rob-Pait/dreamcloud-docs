=======================================
How to upload an SSH key via the web UI
=======================================

DreamCompute utilizes ssh keys for accessing your instances, instead of using
passwords alone.  This is done for increased security and simplifies managing
users for OpenStack (the public key is injected into the instance at boot).
This prevents needing to modify files or passwords on the operating system on
startup.

SSH keypairs are managed on the
`Access & Security - Keypairs <https://dashboard.dreamcompute.com/project/access_and_security/?tab=access_security_tabs__keypairs_tab>`_
section of the dashboard.

SSH Key Components
~~~~~~~~~~~~~~~~~~

There are two parts to an SSH key: a private key and a public key.  The private
key is known only to you and should be safeguarded.  On unix-based systems such
as Mac and Linux, the private key is generally stored in:

.. code-block:: bash

    /home/myuser/.ssh/id_rsa

The public key can be shared with any server that you would like ssh access
to.  Similarly, the public key will be stored in:

.. code-block:: bash

    /home/myuser/.ssh/id_rsa.pub

SSH keys generated on Windows systems using the
`PuTTY <http://www.chiark.greenend.org.uk/~sgtatham/putty/>`_ key generator
(puttygen.exe) are not stored in a uniform location, but instead where the
user chooses to save them.

Create a new SSH key
~~~~~~~~~~~~~~~~~~~~

via the DreamCompute dashboard
------------------------------

The easiest way to generate a key is to have DreamCompute generate one for
you.  You can do this by going to the DreamCompute
`Access & Security - Keypairs <https://dashboard.dreamcompute.com/project/access_and_security/?tab=access_security_tabs__keypairs_tab>`_
dashboard.  On the top right, click the "Create
Keypair" button, give the key a name, and click "Create Keypair".  Your
browser will start downloading the private key named the same as they name
given with a .pem file extension.  Save this file for later user as your
id_rsa private key file.

via puttygen.exe
----------------

This program can be downloaded from the
`PuTTY <http://www.chiark.greenend.org.uk/~sgtatham/putty/>`_ website.  After
running the program, click on the "generate" button, and follow the
instructions to generate random data.  When complete, you can click the "save
private key" button to save the .ppk (PuTTY Private Key File) file for use
with PuTTY later.  The text at the top labeled "Public key for pasting into
OpenSSH authorized_keys file" can be copy/pasted into a text file for
importing into the DreamCompute dashboard and other future uses.  The "save
public key" button saves a modified version of the public key that won't
directly import into the DreamCompute dashboard.  Save these files in a safe
location.  The final step is to continue to the
Import an Existing section to import the key into DreamCompute.

Here is an example of the puttygen.exe program:

.. figure:: images/Puttygen.png
    :alt: Putty

via ssh-keygen
--------------

This program can be found on Mac, Linux and other unix-based operating
systems.

When run:

STEP 1: Enter a file name to save private key to (**hit enter for the
recommended default that you see in parenthesis**).

STEP 2: Enter a password (recommended). You can press enter twice to not have
a password.

The output looks like this:

.. code-block:: bash

    $ ssh-keygen -t rsa
    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/myuser/.ssh/id_rsa):
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /home/myuser/.ssh/id_rsa.
    Your public key has been saved in /home/myuser/.ssh/id_rsa.pub.
    The key fingerprint is:
    66:d9:a4:f0:8d:0b:72:93:b8:67:2e:af:f6:91:ce:e3 myuser@mycomputer
    The key's randomart image is:
    +--[ RSA 2048]----+
    |                 |
    |                 |
    |      .   .      |
    |     . + B       |
    |    o = S o      |
    |     + * .       |
    |    . = .        |
    |    o*..         |
    |   ..*E.         |
    +-----------------+

The final step is to continue to the
Import an Existing SSH Key section to import the key
into DreamCompute.

Checking For An Existing Key
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For a Windows system, there isn't an easy way to find
where keys were generated or stored.  A private key
generated from puttygen.exe is saved with the .ppk file
extension, but the other files it generates has no
default extension.  You could search your system for
.ppk files and perhaps find your public key in the same
location.

On Mac and Linux systems, you can check in the above
described location:

.. code-block:: bash

    $ ls ~/.ssh/id_rsa*
    /home/myuser/.ssh/id_rsa  /home/myuser/.ssh/id_rsa.pub

Import an Existing SSH key into the Dashboard
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Find the public key file, and open it to copy its
contents.  Next, go to the DreamCompute
`Access & Security - Keypairs
<https://dashboard.dreamcompute.com/project/access_and_security/?tab=access_security_tabs__keypairs_tab>`_
dashboard and click on
"Import Keypair".  Give it a name and paste in the
contents of your public key, then click "Import
Keypair" to save it.

Connect to your instance with ssh keys
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once you have your SSH key created and imported into
the dashboard, you can go ahead and create your
instances.  Please make sure to select the keypair you
wish to use on the "Access & Security" tab of the
instance creation screen.  For ssh to work it is
required that port 22 is open in your selected
security group in the DreamCompute
`Access & Security - Security Group <https://dashboard.dreamcompute.com/project/access_and_security/?tab=access_security_tabs__security_groups_tab>`_
dashboard.

Using Windows
-------------

A common program for ssh on windows is
`PuTTY <http://www.chiark.greenend.org.uk/~sgtatham/putty/?>`_
or `putty-nd <http://sourceforge.net/projects/putty-nd/>`_
.  PuTTY requires that you convert your
private key into a .ppk file before it can be used to
connect via ssh.  To do this, open up the PuTTY Key
Generator (puttygen.exe), click the Conversions menu
then "Import Key".  Browse to the folder that contains
the \*.pem file you downloaded from the DreamCompute
dashboard, or the private key you created outside the
Dashboard.  You can give the key a name in the "Key
comment" field, and when finished click the "Save
private key" button to save it into a .ppk file.

Now you can open PuTTY and navigate to the Connection
-> SSH -> Auth setting page to click the "browse"
button near the "Private key file for
authentification" field.  Select the .ppk file you
generated and then click open.  You can now navigate
to the "Session" setting page, and enter into the host
name field "dhc-user@" followed immediately by your
instance's public ip address.  Click Open to start
your session.

Using Mac & Linux
-----------------

On unix based systems, the key will need to setup
first.  There are several ways to do this:

* Configure as your main key
    * Copy the key or .pem file to your home directory, to the ~/.ssh/id_rsa file.

* Configure as an alternative key
    * Copy the key or .pem file to a safe place, and then edit our ~/.ssh/config file to specify that connections to that specific host will use this alternate key.

    .. code-block:: bash

        Host IPADDRESS
        IdentityFile ~/path/to/key

The final step is to connect via ssh:

.. code-block:: bash

    $ ssh dhc-user@IPADDRESS
    Welcome to Ubuntu 12.04.2 LTS (GNU/Linux
    3.5.0-23-generic x86_64)
    dhc-user@example:~$

* No configuration, specifying the key on the command line
    * Connect via ssh -i ~/path/to/key dhc-user@IPADDRESS
