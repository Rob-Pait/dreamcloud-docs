Understand DreamObjects Swift-compatible Authentication
=======================================================

Using the Swift API, authenticated requests need to contain an
authentication token. The authentication token may be obtained through
an authenticator. DreamObjects can also serve as the authenticator. The
``{api version}/{account}`` prefix that this documentation specify in each
request is also obtained through the authentication process.

Swift Auth Compatible RESTful API
=================================

The Swift Auth API is being used for the generation of tokens that can
be used with the RGW Swift API.

Auth Get
--------

Syntax
~~~~~~

::

    GET /auth HTTP/1.1

Request Headers
~~~~~~~~~~~~~~~

+---------------+----------+---------------+
| Name          | Type     | Description   |
+===============+==========+===============+
| X-Auth-Key    | String   |               |
+---------------+----------+---------------+
| X-Auth-User   | String   |               |
+---------------+----------+---------------+

Response Headers
~~~~~~~~~~~~~~~~

+-------------------+----------+---------------+
| Name              | Type     | Description   |
+===================+==========+===============+
| X-Storage-Url     | String   |               |
+-------------------+----------+---------------+
| X-Storage-Token   | String   |               |
+-------------------+----------+---------------+


Access Control Lists
====================

TBD

.. meta::
    :labels: swift authentication
