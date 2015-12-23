======================
What is Object Storage
======================

An object storage system like DreamObjects is like a bottomless pit where you
can add files in without having to care about filling it up. DreamObjects is
like a file system with infinite capacity. Files are stored as `objects` into
`buckets`. From `Wikipedia Object Storage page`_:

    Object storage (also known as object-based storage) is a storage
    architecture that manages data as objects, as opposed to other storage
    architectures like file systems which manage data as a file hierarchy and
    block storage which manages data as blocks within sectors and tracks.
    Each object typically includes the data itself, a variable amount of
    metadata, and a globally unique identifier.
    [...]
    Object storage systems allow relatively inexpensive, scalable and
    self-healing retention of massive amounts of unstructured data.

DreamObjects can be used is used for diverse purposes such as storing photos,
songs, documents, backups and more without worrying of filling up a disk. While
DreamObjects may resemble an FTP system, some details are very different:

- files (objects) stored in DreamObjects have a unique identifier in the form
  of URI.
- objects have metadata attached to describe what the object is, who created
  it, who has access to it, for how long and more. These look like the
  permissions in the FTP directories but they're more powerful and extensible.
- there are no real directories in DreamObjects: the `buckets` are names
  assigned to a common space and are part of the object's URI.

Why the bucket names have to be unique
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Objects stored DreamObjects are identified by a URI that looks like:

   `https://$BUCKET_NAME.objects.dreamhost.com/$OBJECT_NAME`

Since the bucket name is part of the URL, they have to be unique or the
SSL certificate wouldn't work. This means that creating a new bucket requires
creativity.

The easiest way to create a new bucket is to assign a random name and
create a domain alias for it using `DreamHost Control Panel`_.

.. _DreamHost Control Panel: https://panel.dreamhost.com/index.cgi?tree=cloud.objects
.. _Wikipedia Object Storage page: https://en.wikipedia.org/wiki/Object_storage
