======================
What is Object Storage
======================

An object storage system like DreamObjects is like a bottomless pit
where you can add files in without having to care about filling it up.
One can think of object stores like file systems with infinite
capacity. Files are stored as `objects` into `buckets`.

While at first it may resemble like an FTP system, the main difference
is that there is no hierarchy, there are no nested directories inside
buckets. The buckets are very conveniently 'bottomless' because
they're not really tied to the disks, like in a classic operating
system: the actual disks and their capacity are hidden from the user
so they don't have to worry.

Why the bucket names have to be unique
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Objects stored in the bucket can later be retrieved via https at the
URL:

   https://$BUCKET_NAME.objects.dreamhost.com/FILE_NAME

Since the bucket name is part of the URL, they have to be unique or the
SSL certificate wouldn't work.

The easiest way to create a new bucket is to assign a random name and
create a domain alias for it using `DreamHost Control Panel`_.

.. _DreamHost Control Panel: https://panel.dreamhost.com/index.cgi?tree=cloud.objects
