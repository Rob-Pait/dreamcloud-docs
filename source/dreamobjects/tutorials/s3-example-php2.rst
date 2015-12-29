Sample PHP Code Using DreamObjects S3-compatible API
====================================================

.. note::

    This library can be obtained in from Amazon as a `zip file <http://pear.amazonwebservices.com/get/aws.zip>`_
    or from `github <https://github.com/aws/aws-sdk-php>`_.  The
    examples in this guide have been tested against version 2.4.5
    obtained from a zip file. The AWS SDK for PHP 2 requires PHP
    5.3.3+.  The complete API reference is available on the
    `Amazon <http://docs.aws.amazon.com/aws-sdk-php-2/latest/class-Aws.S3.S3Client.html>`_
    site.

Creating a Connection
---------------------

Create an S3 client object to interact with the DHO server.

.. code-block:: php

    <?php
    define('AWS_KEY', 'place access key here');
    define('AWS_SECRET_KEY', 'place secret key here');
    define('HOST', 'https://objects.dreamhost.com');

    // require the AWS SDK for PHP library
    require 'aws-autoloader.php';

    use Aws\S3\S3Client;

    // Establish connection with DreamObjects with an S3 client.
    $client = S3Client::factory(array(
        'base_url' => HOST,
        'key'      => AWS_KEY,
        'secret'   => AWS_SECRET_KEY
    ));


Listing Owned Buckets
---------------------

List buckets owned by the S3 user.

.. code-block:: php

    <?php
    $blist = $client->listBuckets();
    echo "   Buckets belonging to " . $blist['Owner']['ID'] . ":\n";
    foreach ($blist['Buckets'] as $b) {
        echo "{$b['Name']}\t{$b['CreationDate']}\n";
    }

The output will look something like this::

   Buckets belonging to happydhouser:
   mahbuckat1	2011-04-21T18:05:39.000Z
   mahbuckat2	2011-04-21T18:05:48.000Z
   mahbuckat3	2011-04-21T18:07:18.000Z

Creating a Bucket
-----------------

.. code-block:: php

    <?php
    $client->createBucket(array('Bucket' => 'my-new-bucket'));

.. note::
   The library is somewhat inconsistent in its validation of
   permissible bucket names.  Typically the command will reject
   bucket names not safe to use as a subdomain, but does allow
   "_" underscores. Sticking to DNS-safe names is generally the
   best practice.

List a Bucket's Content
-----------------------

Here we request an object iterator and loop over it to retrieve
the desired information about the objects (object key, size,
and modification time stamp in this case).

.. code-block:: php

    <?php
    $o_iter = $client->getIterator('ListObjects', array(
        'Bucket' => $bucketname
    ));
    foreach ($o_iter as $o) {
        echo "{$o['Key']}\t{$o['Size']}\t{$o['LastModified']}\n";
    }

The output will look something like this if the bucket has some files::

   myphoto1.jpg	251262	2011-08-08T21:35:48.000Z
   myphoto2.jpg	262518	2011-08-08T21:38:01.000Z


Deleting a Bucket
-----------------

.. note::

   The Bucket must be empty! Otherwise it won't work!

.. code-block:: php

    <?php
    $client->deleteBucket(array('Bucket' => $new_bucket));

    // optionally, you can wait until the bucket is deleted
    $client->waitUntilBucketNotExists(array('Bucket' => $new_bucket));


Forced Delete for Non-empty Buckets
-----------------------------------

.. attention::

    This feature is not currently supported.


Creating an Object
-------------------

This uploads a file from the filesystem and sets it to be private.

.. code-block:: php

    <?php
    $key         = 'hello.txt';
    $source_file = './hello.txt';
    $acl         = 'private';
    $bucket      = 'my-bucket-name';
    $client->upload($bucket, $key, fopen($source_file, 'r'), $acl);


Change an Object's ACL
----------------------

This changes the availability of the object ``hello.txt`` to be
publicly readable, and object ``secret_plans.txt`` to be private.

.. code-block:: php

    <?php
    $client->putObjectAcl(array(
        'Bucket' => 'my-bucket-name',
        'Key'    => 'hello.txt',
        'ACL'    => 'public-read'
    ));
    $client->putObjectAcl(array(
        'Bucket' => 'my-bucket-name',
        'Key'    => 'secret_plans.txt',
        'ACL'    => 'private'
    ));

.. note::

   'ACL' can be one of: private, public-read, public-read-write, authenticated-read,
   bucket-owner-read, bucket-owner-full-control; `full reference
   <http://docs.aws.amazon.com/aws-sdk-php-2/latest/class-Aws.S3.S3Client.html#_putObjectAcl>`_.

Delete an Object
----------------

This deletes the object ``goodbye.txt``

.. code-block:: php

    <?php
    $client->deleteObject(array(
        'Bucket' => 'my-bucket-name',
        'Key'    => 'goodbye.txt',
    ));


Download an Object (to a file)
------------------------------

This downloads the object ``poetry.pdf`` from 'my-bucket-name' and saves it
in ``/home/larry/documents``

.. code-block:: php

    <?php
    $client->getObject(array(
        'Bucket' => 'my-bucket-name',
        'Key'    => 'poetry.pdf',
        'SaveAs' => '/home/larry/documents/poetry.pdf'
    ));


Generate Object Download URLs (signed and unsigned)
---------------------------------------------------

This generates an unsigned download URL for ``hello.txt``.
This works because we made ``hello.txt`` public by setting
the ACL above. This then generates a signed download URL
for ``secret_plans.txt`` that will work for 1 hour.
Signed download URLs will work for the time period even
if the object is private (when the time period is up,
the URL will stop working).

.. code-block:: php

    <?php
    $plain_url = $client->getObjectUrl('my-bucket-name', 'hello.txt');
    echo $plain_url . "\n";
    $signed_url = $client->getObjectUrl('my-bucket-name', 'secret_plans.txt', '+1 hour');
    echo $signed_url . "\n";

The output of this will look something like::

   http://my-bucket-name.objects.dreamhost.com/hello.txt
   http://my-bucket-name.objects.dreamhost.com/secret_plans.txt?Signature=XXXXXXXXXXXXXXXXXXXXXXXXXXX&Expires=1316027075&AWSAccessKeyId=XXXXXXXXXXXXXXXXXXX

.. meta::
    :labels: PHP S3
