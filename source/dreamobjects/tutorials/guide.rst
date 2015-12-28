###################################################
Getting Started using DreamObjects object store API
###################################################

Introduction
============

This guide will help you get started using DreamObjects via the S3 API. We will
walk through a runnable demo script that exercises many of the functions of
DreamObjects. The script is implemented in the `Python programming language
<http://python.org>`_ using the popular `boto S3 library
<http://pypi.python.org/pypi/boto>`_. Before we get started, you'll need to
create a user with an S3 key in your DreamObjects account in the DreamHost
Panel.

You can download `the example script`_, and then run it using the following
command:

.. code-block:: sh

    ./demo.py --access-key=<access-key> --secret-key=<secret-key>

The script will walk you through an interactive demonstration that illustrates
creating buckets, storing objects, linking to objects, setting permissions, and
removing objects and buckets. The script will also print out the HTTP traffic
that gets sent to DreamObjects.

Sample Output
=============

The following is a sample of the output from running the script for your
reference.

.. literalinclude:: demo/sample-output.sh
   :language: console

Annotated Script
================

Let's walk through the interesting portions of the script, to better understand
how it uses boto to talk to DreamObjects via the S3 API.

Connecting to DreamObjects
--------------------------

.. code-block:: python

        def create_connection(self):
            kwargs = dict(
                aws_access_key_id=self.access_key,
                aws_secret_access_key=self.secret_key,
            )

            if self.show_http_traffic:
                kwargs['debug'] = 2

            if not self.use_s3:
                kwargs['host'] = 'objects.dreamhost.com'

            # create a connection via the S3 protocol to DreamObjects
            self.conn = boto.connect_s3(**kwargs)


The boto ``connect_s3`` function call requires the credentials for accessing the
S3 endpoint and a hostname. The hostname for DreamObjects is
``objects.dreamhost.com``. Boto will use the credentials to sign requests sent to
DreamObjects for security purposes.


Creating Buckets
----------------

.. code-block:: python

        def create_bucket(self):
            self.bucket = self.conn.create_bucket(self.bucket_name)


Creating a bucket is as simple as calling the ``create_bucket`` method on your
connection object and providing a bucket name. Note that the namespace for
buckets is global, and you'll need to be careful to properly handle bucket name
collisions.


Storing Objects
---------------

.. code-block:: python

        def store_object(self):
            self.key = self.bucket.new_key(self.object_name)
            self.key.set_contents_from_filename(self.object_name)


Boto allows you to upload objects to buckets by calling the ``new_key`` method on
your bucket object, which returns a key object. Key objects allow you to
manipulate the object, including uploading the contents of the object using the
``set_contents_from_filename`` method.


Linking to Objects
------------------

.. code-block:: python

        def get_public_reference(self):
            self.public_url = self.key.generate_url(
                0, query_auth=False, force_http=True
            )


Linking to objects in DreamObjects is as simple as generating a link using a
simple pattern. Boto provides a shortcut via the ``generate_url`` method on key
objects. DreamObjects supports two formats for public links to objects:

.. code-block: sh

    http://<bucket-name>.objects.dreamhost.com/<key-name>
    http://objects.dreamhost.com/<bucket-name>/<key-name>


If the object that you are attempting to link to isn't accessible because of
permissions on the object, you can generate a "signed" URL for the object that
can be active for a limited period of time.


.. code-block:: python

        def generate_signed_url(self):
            self.signed_url = self.key.generate_url(
                3600, query_auth=True, force_http=True
            )

Key objets in boto provide a utility method for generating signed URLs. Simply
call the ``generate_url`` method and pass a number of seconds for the link to be
active, and pass the ``query_auth`` keyword argument as ``True``.


Setting ACLs
------------

.. code-block:: python

        def set_permissions(self):
            self.key.set_canned_acl('public-read')


DreamObjects provides a series of "canned ACLs" compliant with the S3 API that
can be easily set on objects using the ``set_canned_acl`` method. In this case,
we are setting our object to have the ``public-read`` ACL so that it is
accessible via public links.


Deleting Objects and Buckets
----------------------------

.. code-block:: python

        def delete_bucket_fail(self):
            try:
                self.conn.delete_bucket(self.bucket_name)
            except:
                print('   -> The bucket could not be deleted because ' +
                             'it still contains an object!')

        def delete_object(self):
            self.bucket.delete_key(self.object_name)

        def delete_bucket(self):
            self.conn.delete_bucket(self.bucket_name)


Deleting objects and buckets is also a simple method call away using boto.
Note that buckets that contain objects cannot be deleted until all of the
objects within the bucket have been deleted. Deleting objects is simply a matter
of calling the ``delete_key`` method on a bucket. Deleting buckets is achieved
by calling the ``delete_bucket`` method on a connection.


Digging Deeper
==============

Now that you've walked through this simple guide, you should be ready to dive
deeper into DreamObjects! Take a look at the api documentation

.. _the example script: https://raw.githubusercontent.com/dreamhost/dreamcloud-docs/master/dreamobjects/tutorials/source/demo/demo.py

.. meta::
    :labels: api S3 boto acl bucket
