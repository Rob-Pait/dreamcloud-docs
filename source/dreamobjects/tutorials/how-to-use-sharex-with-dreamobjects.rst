===================================
How to Use ShareX with DreamObjects
===================================

Overview
~~~~~~~~

.. figure:: images/sharex-logo.png

`ShareX <http://getsharex.com>`_ is a free and open source Windows application
that you can use for taking screenshots and then sharing them with others.
Starting with version 9.0.0, you can easily upload screenshots to
DreamObjects. ShareX takes advantage of the S3 API compatibility of
DreamObjects to allow it to be configured as a destination.

Setting up ShareX with DreamObjects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Launch ShareX.

    .. figure:: images/01_ShareX.fw.png

2. On the left, click the 'Destinations' menu item and then select
   'Destination settings...'

    .. figure:: images/02_ShareX.fw.png

3. From the Destination Settings option, scroll down to the 'File Uploaders'
   section.
4. Select 'Amazon S3'.
5. Select 'DreamObjects' from the 'Endpoint' dropdown in the main window.

    .. figure:: images/03_ShareX.fw.png

6. Enter the `Access key and Secret key`_ in
   the selected fields

    .. figure:: images/04_ShareX.fw.png

7. To route the destination of the screenshots and other information to
   DreamObjects, return to the 'Destinations' folder option within SharedX.
8. Select the 'Image uploader' > 'File uploader' > 'Amazon S3' option as shown
   in the above screenshot.
9. Repeat the previous step to enable Text and File uploads.

.. _Access key and Secret key: 215986357-What-are-Keys-in-DreamObjects-and-How-Do-You-Use-Them-

.. meta::
    :labels: sharex
