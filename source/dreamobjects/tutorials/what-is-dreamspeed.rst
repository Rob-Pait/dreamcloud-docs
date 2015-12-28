===================
What is DreamSpeed?
===================

Overview
~~~~~~~~

DreamSpeed CDN is a content delivery network for DreamObjects.

Powered by Fastly – the smartest CDN on the planet – DreamSpeed CDN comes with
all SSD storage and 10Gb Ethernet for delivery at high speeds. With DreamSpeed
CDN, you can significantly speed up your sites and applications, lighten the
load on your web servers, and give users a faster experience.

How does DreamSpeed CDN work?
-----------------------------

When users download files and media through their browser from DreamObjects,
data is typically fetched from data centers
in Southern California. When DreamSpeed CDN is enabled, your files and media
are copied securely to servers all around the world, and your users are
automatically connected to a copy that is geographically closest to them,
resulting in a much faster download.

Features
--------
 - One button acceleration – enable DreamSpeed CDN with just a click.
 - Unlimited instant purge and refresh of accelerated content.
 - Use your own domain name to deliver content from DreamSpeed CDN.
 - Secure SSL content delivery using the objects.cdn.dream.io domain.
 - Great pricing from only $0.12/GB for US and Europe, and $0.19/GB for
   Asia-Pacific, Australia, and New Zealand.
 - Fully integrated with DreamObjects.

Benefits
~~~~~~~~

Speed up your site
------------------

Get your media, files, and downloads into the hands of your users quickly, by
leveraging DreamSpeed CDN’s global network of content delivery servers. Works
great with small files like JavaScript and CSS content, or large files like
photos and videos.

Take a load off
---------------

By delivering your static content from the DreamSpeed CDN, you not only speed
up your site but you also lighten the load on your web server, allowing it to
focus on delivering only the dynamic parts of your site or application.

Integrated DNS setup
--------------------

DreamSpeed CDN works great whether you host your DNS with DreamHost or not. If
you do choose to host your DNS with DreamHost, the DreamSpeed CDN automatically
makes the appropriate DNS changes on your behalf.

Setting up DreamSpeed CDN
~~~~~~~~~~~~~~~~~~~~~~~~~

Important: DreamSpeed CDN is a feature of DreamObjects rather than a
standalone product, therefore you must first set up DreamObjects in the
panel (i.e.,create a bucket, store files, and so on).

1. Navigate to the (`Panel > ‘Cloud Services’ > ‘DreamObjects’`_) page.
    .. figure:: images/01_DreamSpeed_CDN.fw.png
        :alt: DreamObjects
2. To the right of your bucket, click the ‘Change Settings’ link.
    .. figure:: images/02_DreamSpeed_CDN.fw.png
        :alt: Bucket Settings
3. Enter your alias and choose the domain you wish to assign this to.
4. At the bottom, toggle the ‘CDN SUPPORT’ option. This enables the checkbox
   titled ‘Use CDN’ to appear at the right of the alias.
5. Check the ‘Use CDN’ checkbox.
6. Click the **Save Settings** button to save. *When you return to the
   DreamObjects page, the green ‘CDN’ icon appears which confirms it’s
   been configured:*

    .. figure:: images/03_DreamSpeed_CDN.fw.png
        :alt: CDN icon

Delivering CSS, JavaScript, and other static assets
---------------------------------------------------

To accelerate your downloads for a better user experience, you can enable a
DreamObjects bucket to use a CDN:

1. Enable DreamSpeed CDN for a bucket.
2. Store your files in the DreamObjects bucket for which you enabled DreamSpeed
   CDN.
3. Select a method to upload your files into DreamObjects using one of the
   following:

   - Upload from the panel
   - Use a compatible application such as Cyberduck
   - Upload directly from the command line using a tool such as s3cmd.

4. Update your site to use the DreamSpeed CDN links so that your content is
   delivered from the CDN.

    - By default, the DreamSpeed CDN link will use the following format:

    .. code::

        http://<bucket>.objects.cdn.dream.io/<file_name>

External CSS example
^^^^^^^^^^^^^^^^^^^^

**Before-**

.. code::

    <head>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    </head>

**Using DreamSpeed CDN-**

.. code::

    <head>
    <link rel="stylesheet" type="text/css"
    href="http://mybucket.objects.cdn.dream.io/mystyle.css">
    </head>

Using your own domain name for accelerated content
--------------------------------------------------

To use an alias for your domain, enter a name in the 'Domain Alias' field box
and then click the **Save Settings** button when finished.

Using with WordPress
--------------------

To utilize DreamSpeed CDN with WordPress, use the following available plugin:

`DreamSpeed CDN WordPress Plugin <https://wordpress.org/plugins/dreamspeed-cdn/>`_

.. _Panel > ‘Cloud Services’ > ‘DreamObjects’: https://panel.dreamhost.com/index.cgi?tree=cloud.objects>

.. meta::
    :labels: cdn bucket
