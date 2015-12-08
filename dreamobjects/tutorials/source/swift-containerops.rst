Swift Container Operations
==========================

Create Container
----------------

DreamObjects Containers are referred to as "Buckets."  Buckets are storage
areas that can hold data, also known as "Objects."

Constraints
~~~~~~~~~~~

Bucket names are used in the URL when accessing objects, and must be globally unique.


Syntax
~~~~~~

::

    PUT /{api version}/{account}/{container} HTTP/1.1



Parameters
~~~~~~~~~~

Headers
~~~~~~~

+-----------------------+---------------+------------+
| Name                  | Description   | Required   |
+=======================+===============+============+
| X-Container-Read      |               | No         |
+-----------------------+---------------+------------+
| X-Container-Write     |               | No         |
+-----------------------+---------------+------------+
| X-Container-Meta-\*   |               | No         |
+-----------------------+---------------+------------+

HTTP Response
~~~~~~~~~~~~~

If a container with the same name already exists, and the user is the
container owner, the operation will succeed. Otherwise the operation
will fail.

+---------------+-----------------------+-------------------------------------------------------------+
| HTTP Status   | Status Code           | Description                                                 |
+===============+=======================+=============================================================+
| 409           | BucketAlreadyExists   | Container already exists under different user's ownership   |
+---------------+-----------------------+-------------------------------------------------------------+

Remove Container
----------------

Deletes a DreamObjects container, also known as a "Bucket". Once you've successfully removed the Bucket,
you'll be able to reuse the Bucket name.

If you'd like to check and see if the Bucket is empty, or contains any Objects before you remove it, you
can use a HEAD request against the Bucket

Syntax
~~~~~~

::

     DELETE /{api version}/{account}/{container} HTTP/1.1

Headers
~~~~~~~

HTTP Response
~~~~~~~~~~~~~

+---------------+---------------+---------------------+
| HTTP Status   | Status Code   | Description         |
+===============+===============+=====================+
| 204           | NoContent     | Container removed   |
+---------------+---------------+---------------------+

List Container Objects
--------------------------

Use the Get request in combination with the Bucket name to retrieve a list of the objects stored within.

You can specify query parameters to filter the full list, or leave out the paremeters to return a list
of the first 10,000 object names stored in the Bucket.

Syntax
~~~~~~

::

      GET /{api version}/{account}/{container}[?parm=value] HTTP/1.1

Parameters
~~~~~~~~~~

+-------------+-----------------+----------------+------------+
| Name        | Description     | Valid Values   | Required   |
+=============+=================+================+============+
| format      | result format   | json, xml      | No         |
+-------------+-----------------+----------------+------------+
| prefix      |                 |                | No         |
+-------------+-----------------+----------------+------------+
| marker      |                 |                | No         |
+-------------+-----------------+----------------+------------+
| limit       |                 |                | No         |
+-------------+-----------------+----------------+------------+
| delimiter   |                 |                | No         |
+-------------+-----------------+----------------+------------+
| path        |                 |                | No         |
+-------------+-----------------+----------------+------------+

Response Entities
~~~~~~~~~~~~~~~~~

+------------------+-------------+---------------+
| Name             | Type        | Description   |
+==================+=============+===============+
| container        | Container   |               |
+------------------+-------------+---------------+
| object           | Container   |               |
+------------------+-------------+---------------+
| name             | String      |               |
+------------------+-------------+---------------+
| hash             | String      |               |
+------------------+-------------+---------------+
| last\_modified   | Date        |               |
+------------------+-------------+---------------+
| hash             | String      |               |
+------------------+-------------+---------------+
| content\_type    | String      |               |
+------------------+-------------+---------------+

Update Container Metadata
-------------------------

Create any, and as many metadata headers as you want, but they'll need to use the
X-Container-Meta- format.

Syntax
~~~~~~

::

    POST /{api version}/{account}/{container}/{object} HTTP/1.1

Request Headers
~~~~~~~~~~~~~~~

+---------------------+---------------+----------------+------------+
| Name                | Description   | Valid Values   | Required   |
+=====================+===============+================+============+
| X-Container-Read    |               |                | No         |
+---------------------+---------------+----------------+------------+
| X-Container-Write   |               |                | No         |
+---------------------+---------------+----------------+------------+
