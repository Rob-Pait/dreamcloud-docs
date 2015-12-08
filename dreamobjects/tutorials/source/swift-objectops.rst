Object Operations
=================

Put Object
----------

Adds an object to a Bucket.  You must have write permissions on the Bucket to
perform this operation.

Syntax
~~~~~~

::

    PUT /{api version}/{account}/{container}/{object} HTTP/1.1

Request Headers
~~~~~~~~~~~~~~~

+---------------------+---------------+----------------+------------+
| Name                | Description   | Valid Values   | Required   |
+=====================+===============+================+============+
| ETag                |               |                | No         |
+---------------------+---------------+----------------+------------+
| Content-Type        |               |                | No         |
+---------------------+---------------+----------------+------------+
| Transfer-Encoding   |               | chunked        | No         |
+---------------------+---------------+----------------+------------+

Copy Object
-----------

To copy an object, use PUT and specify a destination bucket and the object name.

Syntax
~~~~~~

::

    PUT /{api version}/{account}/{dest-container}/{dest-object} HTTP/1.1
    x-amz-copy-source: {source-container}/{source-object}

or alternatively:

::

    COPY /{api version}/{account}/{source-container}/{source-object} HTTP/1.1
    Destination: /{dest-container}/{dest-object}

Request Headers
~~~~~~~~~~~~~~~

+-----------------------+---------------+----------------+--------------+
| Name                  | Description   | Valid Values   | Required     |
+=======================+===============+================+==============+
| X-Copy-From           |               |                | Yes (PUT)    |
+-----------------------+---------------+----------------+--------------+
| Destination           |               |                | Yes (COPY)   |
+-----------------------+---------------+----------------+--------------+
| If-Modified-Since     |               |                | No           |
+-----------------------+---------------+----------------+--------------+
| If-Unmodified-Since   |               |                | No           |
+-----------------------+---------------+----------------+--------------+
| Copy-If-Match         |               |                | No           |
+-----------------------+---------------+----------------+--------------+
| Copy-If-None-Match    |               |                | No           |
+-----------------------+---------------+----------------+--------------+

Remove Object
-------------

Removes an object. Requires WRITE permission set on the containing
Bucket.


Syntax
~~~~~~

::

    DELETE /{api version}/{account}/{container}/{object} HTTP/1.1

Get Object
----------

Retrieve an Object's data using the GET request.

You can pefrom conditional GET requests using if-* headers.

You can also fetch only a portion of the data using Range headers.


Syntax
~~~~~~

::

    GET /{api version}/{account}/{container}/{object} HTTP/1.1

Request Headers
~~~~~~~~~~~~~~~

+-----------------------+---------------+----------------+------------+
| Name                  | Description   | Valid Values   | Required   |
+=======================+===============+================+============+
| Range                 |               |                | No         |
+-----------------------+---------------+----------------+------------+
| If-Modified-Since     |               |                | No         |
+-----------------------+---------------+----------------+------------+
| If-Unmodified-Since   |               |                | No         |
+-----------------------+---------------+----------------+------------+
| If-Match              |               |                | No         |
+-----------------------+---------------+----------------+------------+
| If-None-Match         |               |                | No         |
+-----------------------+---------------+----------------+------------+

Response Headers
~~~~~~~~~~~~~~~~

+-----------------+---------------------------------------------------+
| Name            | Description                                       |
+=================+===================================================+
| Content-Range   | Data range, will only be returned if the range    |
|                 | header field was specified in the request         |
+-----------------+---------------------------------------------------+

Get Object Info
---------------

Returns information about object. This request will return the same
header information as the Get Object request, but will not include
the object data payload.

Syntax
~~~~~~

::

    HEAD /{api version}/{account}/{container}/{object} HTTP/1.1

Request Headers
~~~~~~~~~~~~~~~

+-----------------------+---------------+----------------+------------+
| Name                  | Description   | Valid Values   | Required   |
+=======================+===============+================+============+
| Range                 |               |                | No         |
+-----------------------+---------------+----------------+------------+
| If-Modified-Since     |               |                | No         |
+-----------------------+---------------+----------------+------------+
| If-Unmodified-Since   |               |                | No         |
+-----------------------+---------------+----------------+------------+
| If-Match              |               |                | No         |
+-----------------------+---------------+----------------+------------+
| If-None-Match         |               |                | No         |
+-----------------------+---------------+----------------+------------+

Update Object Metadata
----------------------

You can use POST operations against an object name to set and
overwrite arbitrary key/value metadata.  You can also use POST operations
to assign headers that are not already assigned such as X-Delete-At
or X-Delete-After for expiring objects.

You cannot use the POST operation to change any of the object's other
headers such as Content-Type, ETag, etc. It is not used to upload storage
objects (see PUT). When you need to update metadata or other headers such
as Content-Type or CORS headers, refer to copying an object.

Key names must be prefixed with X-Object-Meta-. A POST request will delete
all existing metadata added with a previous PUT/POST.

Syntax
~~~~~~

::

    POST /{api version}/{account}/{container}/{object} HTTP/1.1

Request Headers
~~~~~~~~~~~~~~~

+--------------------+----------+---------------+
| Name               | Type     | Description   |
+====================+==========+===============+
| X-Object-Meta-\*   | String   |               |
+--------------------+----------+---------------+
