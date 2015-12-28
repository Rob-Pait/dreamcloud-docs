=====================================
How to upload files into DreamObjects
=====================================

There are a wide variety of ways to store files in DreamObjects,
mainly depending on your preferences and skills.

- using a browser: upload files using the `DreamObjects control
  panel`_. File size is limited to 64Mb in this case.
- using desktop applications: There are various applications, from
  desktop and command line utilities to WordPress plugins to mobile
  apps, that allow you to store files in DreamObjects. All of these
  applications use the RESTful API, making it easy to integrate with
  DreamObjects.
- using the REST API and any of the libraries supporting either the S3
  or OpenStack Swift API.

Objects are limited to 10TBs, but must be uploaded in 5GB chunks.
Please note, not all clients are able to do multipart uploads. For
anything above 5GB, you must use a client that supports multi-part
uploads.

DreamObjects is designed for 99.99999% durability over a given year
and your data is replicated three times, with immediate consistency,
throughout the DreamObjects' data center ensuring further backup
security.

DreamObjects is capable of storing almost any type of file, so long as
it meets the conditions of the `Acceptable Use Policy`_.

.. _DreamObjects control panel: https://panel.dreamhost.com/index.cgi?tree=cloud.objects&
.. _Acceptable Use Policy: http://dreamhost.com/acceptable-use-policy/

.. meta::
    :labels: desktop upload object bucket
