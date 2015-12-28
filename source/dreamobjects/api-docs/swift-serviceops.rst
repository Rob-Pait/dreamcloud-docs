Understand DreamObjects Swift-compatible Service Operations
===========================================================

List Containers
---------------

A request that lists the buckets can only be run using a specific user's
credentials, and cannot be run anonymously

Syntax
~~~~~~

::

    GET /{api version}/{account} HTTP/1.1

Parameters
~~~~~~~~~~

+----------+-----------------+----------------+------------+
| Name     | Description     | Valid Values   | Required   |
+==========+=================+================+============+
| format   | result format   | json, xml      | No         |
+----------+-----------------+----------------+------------+
| marker   |                 |                | No         |
+----------+-----------------+----------------+------------+
| limit    |                 |                | No         |
+----------+-----------------+----------------+------------+

Headers
~~~~~~~

Response Entities
~~~~~~~~~~~~~~~~~

+-------------+-------------+---------------------------------------+
| Name        | Type        | Description                           |
+=============+=============+=======================================+
| account     | Container   | Container for list of containers      |
+-------------+-------------+---------------------------------------+
| container   | Container   | Container for container information   |
+-------------+-------------+---------------------------------------+
| name        | String      | Bucket name                           |
+-------------+-------------+---------------------------------------+
| bytes       | Integer     | Total container size                  |
+-------------+-------------+---------------------------------------+

.. meta::
    :labels: swift bucket
