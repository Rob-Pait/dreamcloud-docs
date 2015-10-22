======================
What is Object Storage
======================

An object storage system like DreamObjects is like a bottomless pit
where you can add files in without having to care about filling it up.
All you have to care about is the name of such bottomless pit, or
`bucket` in object storage lingo.

While at first it may resemble like an FTP system, the main difference
is that there is no hierarchy, no nested directories inside `buckets`.
The buckets are very conveniently 'bottomless' because they're not
really tied to the disks, like in a classic operating system: the
disks and their capacity are hidden from the user.

Whatever file you put in the bucket, you can later access it by
visiting its URL:

   https://$BUCKET_NAME.objects.dreamhost.com/FILE_NAME

Since the buckets are part of the URL, they have to be unique or the
SSL certificate wouldn't work. A random bucket name is the best way to
name one, and `create a domain alias on DreamObjects control panel`_
#FIXME.

Objects in the bucket can have sophisticated privacy options through
permissions (ACL) and expiration, using the `control panel`_ or via
API. API Documentation is available at
`http://docs.dreamobjects.net/`_.

In order to upload, download and delete files, one needs to use
`software that supports either the S3 or OpenStack Swit API`_.
