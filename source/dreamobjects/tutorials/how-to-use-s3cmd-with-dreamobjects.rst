==================================
How to use S3cmd with DreamObjects
==================================

Overview
~~~~~~~~

`S3cmd <http://s3tools.org/s3cmd>`_ is:
    * a command-line tool for uploading, retrieving, and managing data in
      Amazon S3 and other Cloud Storage Service Providers that use the S3
      protocol such as DreamHost DreamObjects.
    * best suited for power users who don't fear command line.
    * ideal for scripts, automated backups triggered from cron, and so on.

The following instructions help you install and configure s3cmd to work with
DreamObjects.

Installing S3cmd
~~~~~~~~~~~~~~~~

These instructions were performed with **s3cmd v1.5.2**. If you'd like to
install a different version, you'll need to modify the file names
appropriately.

1. Log in to your account using SSH.
2. Create a bin directory in your home directory if you don't have one
   already.

    .. code::

        mkdir ~/bin

3. Download the `latest release of s3cmd from GitHub
   <https://github.com/s3tools/s3cmd/releases>`_.

    .. code::

        curl -O -L https://github.com/s3tools/s3cmd/archive/v1.5.2.tar.gz

4. Untar the file.

    .. code::

        tar xzf v1.5.2.tar.gz

    *You should now have a directory called s3cmd-1.5.2*

5. Change into that directory

    .. code::

        cd s3cmd-1.5.2

6. Copy the s3cmd executable and S3 folder into the bin directory we created
   earlier

    .. code::

        cp -R s3cmd S3 ~/bin

7. Add the bin directory to your path so that you can execute the newly
   installed script.

    .. note::

        This assumes you're using the default bash shell. If you're
        using a different shell, you'll have to set the path in
        the proper place.

    .. code::

        echo "export PATH=$HOME/bin:$PATH" >> ~/.bashrc

8. Execute your bash profile for it to take effect

    .. code::

        . ~/.bash_profile

Configuring S3cmd
~~~~~~~~~~~~~~~~~

Instead of following the instructions on the s3cmd site to configure it, just
do the following:

1. Create a file in your home directory called .s3cfg (note the leading "dot")
2. Copy this file into it.
3. Include your access key and secret key from the `DreamObjects control panel
   <https://panel.dreamhost.com/index.cgi?tree=cloud.objects&>`_.

.. code::

    [default]
    access_key = Your_DreamObjects_Access_Key
    secret_key = Your_DreamObjects_Secret_Key
    host_base = objects.dreamhost.com
    host_bucket = %(bucket)s.objects.dreamhost.com
    enable_multipart = True
    multipart_chunk_size_mb = 15
    use_https = True

Example Commands
~~~~~~~~~~~~~~~~

**Making a bucket**

.. code::

    $ s3cmd mb s3://s3cmd-justin
    Bucket 's3://s3cmd-justin/' created

**Listing all buckets**

.. code::

    $ s3cmd ls
    2014-02-28 16:28  s3://s3cmd-justin

**Uploading a file into a bucket**

.. code::

    $ s3cmd put testfile.txt s3://s3cmd-justin/
    testfile.txt -> s3://s3cmd-justin/testfile.txt  [1 of 1]
    127 of 127   100% in    0s  1522.87 B/s  done

**Listing the contents of a bucket**

.. code::

    $ s3cmd ls s3://s3cmd-justin
    2014-02-28 16:29       127   s3://s3cmd-justin/testfile.txt

**Downloading a file from a bucket**

.. code::

    $ s3cmd get s3://s3cmd-justin/testfile.txt
    s3://s3cmd-justin/testfile.txt -> ./testfile.txt  [1 of 1]
    127 of 127   100% in    0s     3.46 kB/s  done

**Deleting a file in a bucket**

.. code::

    $ s3cmd del s3://s3cmd-justin/testfile.txt
    File s3://s3cmd-justin/testfile.txt deleted

**Listing the size of a bucket**

.. code::

    $ s3cmd du -H s3://s3cmd-justin
    40G      s3://s3cmd-justin
