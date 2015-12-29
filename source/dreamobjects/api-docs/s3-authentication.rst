===============================================
How To Authenticate to DreamObjects with S3 API
===============================================

Requests to DreamObjects can be either authenticated or unauthenticated.
DreamObjects assumes unauthenticated requests are sent by an anonymous user.
DreamObjects supports canned ACLs.

Authentication
--------------
Authenticating a request requires including an access key and a Hash-based
Message Authentication Code (HMAC) in the request before it is sent to the
RGW server. RGW uses an S3-compatible authentication approach.

::

    HTTP/1.1
    PUT /buckets/bucket/object.mpeg
    Host: objects.dreamhost.com
    Date: Mon, 2 Jan 2012 00:01:01 +0000
    Content-Encoding: mpeg
    Content-Length: 9999999

    Authorization: AWS {access-key}:{hash-of-header-and-secret}

In the foregoing example, replace ``{access-key}`` with the value for your access
key ID followed by a colon (``:``). Replace ``{hash-of-header-and-secret}`` with
a hash of the header string and the secret corresponding to the access key ID.

To generate the hash of the header string and secret, you must:

#. Get the value of the header string.
#. Normalize the request header string into canonical form.
#. Generate an HMAC using a SHA-1 hashing algorithm.
   See `RFC 2104`_ and `HMAC`_ for details.
#. Encode the ``hmac`` result as base-64.

To normalize the header into canonical form:

#. Get all fields beginning with ``x-amz-``.
#. Ensure that the fields are all lowercase.
#. Sort the fields lexicographically.
#. Combine multiple instances of the same field name into a
   single field and separate the field values with a comma.
#. Replace white space and line breaks in field values with a single space.
#. Remove white space before and after colons.
#. Append a new line after each field.
#. Merge the fields back into the header.

Replace the ``{hash-of-header-and-secret}`` with the base-64 encoded HMAC string.

.. _RFC 2104: http://www.ietf.org/rfc/rfc2104.txt
.. _HMAC: http://en.wikipedia.org/wiki/HMAC

.. meta::
    :labels: S3 authentication
