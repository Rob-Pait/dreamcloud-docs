DreamObjects Interactive Demo
=============================

This demonstration will walk through the process of creating a bucket,
storing objects in the bucket, setting permissions on objects, deleting
objects and buckets, and even viewing objects by URL in your web
browser.

Press ENTER to continue...

Connecting to DreamObjects
--------------------------

DreamObjects can be connected to via the Amazon S3 protocol. By
supplying an "access key" and a "secret key", and setting the hostname
for connections to "objects.dreamhost.com", you can use most standard
Amazon S3 access libraries.

This demonstration is implemented in Python, with the Boto library.

Credentials used for this demo:
Access Key: [redacted]
Secret Key: [redacted]

Press ENTER to continue...

Creating connection to DreamObjects...
-> success!

Creating Buckets
----------------

DreamObjects supports the standard notions of "buckets" and "objects".
Bucket names are globally unique, so for the purposes of this demo,
we'll be generating a sample bucket name that should be available:

Bucket Name: 3c7478c6-6684-4a8d-9179-8e1390d73623

Press ENTER to continue...

Creating bucket...
send: 'PUT / HTTP/1.1\r\nHost: 3c7478c6-6684-4a8d-9179-8e1390d73623.objects.dreamhost.com\r\nAccept-Encoding: identity\r\nDate: Wed, 18 Jul 2012 21:45:19 GMT\r\nContent-Length: 0\r\nAuthorization: AWS b7fasgg8A8tTPkt773Tgd:asdf987jlj43209808s=\r\nUser-Agent: Boto/2.3.0 (darwin)\r\n\r\n'
reply: 'HTTP/1.1 200 OK\r\n'
header: Date: Wed, 18 Jul 2012 21:45:21 GMT
header: Server: Apache
header: Connection: close
header: Transfer-Encoding: chunked
header: Content-Type: application/xml
-> success!

Creating Objects
----------------

Objects live inside buckets and represent a chunk of data, which
frequently correspond to files. In this case, we're going to store
an object inside the bucket that is the DreamHost logo in PNG
format. Object names are unique within a bucket.

Object Name: dreamhost-logo.png

Press ENTER to continue...

Storing object in bucket...
send: 'PUT /dreamhost-logo.png HTTP/1.1\r\nHost: 3c7478c6-6684-4a8d-9179-8e1390d73623.objects.dreamhost.com\r\nAccept-Encoding: identity\r\nContent-Length: 18236\r\nContent-MD5: lxpmHnApXXb3gBUWpnZ+WQ==\r\nExpect: 100-Continue\r\nDate: Wed, 18 Jul 2012 21:45:23 GMT\r\nUser-Agent: Boto/2.3.0 (darwin)\r\nContent-Type: image/png\r\nAuthorization: AWS asdf08asdf789798asd:231497asdf7890asdf789=\r\n\r\n'
-> success!

Linking to Objects
------------------

Objects can be referenced by a public URL, which is of the format:

http://<bucket-name>.objects.dreamhost.com/<object-name>

The URL for our object will thus be:

http://3c7478c6-6684-4a8d-9179-8e1390d73623.objects.dreamhost.com/dreamhost-logo.png

Press ENTER to continue...

Getting public reference to object...
-> success!

Object Permissions
------------------

Object access is governed by a set of permissions on that object.
These "ACLs" can be applied after the object has been created. The
default ACL for objects is private, meaning that we won't be able to
actually access the object via its public URL.

Let's open the URL in a web browser to illustrate that point.

Press ENTER to continue...

Opening URL in browser window....
-> success!

Signed URLs
-----------

One way to grant access to an object that isn't publicly readable
is to generate a "signed" URL that expires after a certain period
of time. Let's generate one for our object.

Press ENTER to continue...

Generating a signed URL for the object...
-> success!

Viewing Signed URLs
-------------------

Let's illustrate that our signed URL grants us access to our object
by viewing it in a web browser.

Signed Url: http://3c7478c6-6684-4a8d-9179-8e1390d73623.objects.dreamhost.com/dreamhost-logo.png?Signature=%2F7oDsF8vkvSyVwcMY0EsBFTn1uU%3D&Expires=1342651528&AWSAccessKeyId=U6f9dy7aA8tTPktHKTgd

Press ENTER to continue...

Opening signed URL in browser window...
-> success!

Setting Object Permissions
--------------------------

DreamObjects supports the full spectrum of S3-like ACLs, including
some "canned" ACLs that provide commonly used permissions. Let's mark
our object with the "public-read" canned ACL.

Press ENTER to continue...

Setting permissions to "public-read" on object...
send: 'PUT /dreamhost-logo.png?acl HTTP/1.1\r\nHost: 3c7478c6-6684-4a8d-9179-8e1390d73623.objects.dreamhost.com\r\nAccept-Encoding: identity\r\nDate: Wed, 18 Jul 2012 21:45:32 GMT\r\nContent-Length: 0\r\nx-amz-acl: public-read\r\nAuthorization: AWS 098123597123478asdf:9asf89778+ieW6DE2WDM=\r\nUser-Agent: Boto/2.3.0 (darwin)\r\n\r\n'
reply: 'HTTP/1.1 200 OK\r\n'
header: Date: Wed, 18 Jul 2012 21:45:32 GMT
header: Server: Apache
header: Connection: close
header: Transfer-Encoding: chunked
header: Content-Type: application/xml
-> success!

Let's prove that we've successfully set the ACL by opening the
public URL for the object in a browser again. This time, we should
see the DreamHost logo load.

Press ENTER to continue...

Viewing object in browser...
-> success!

Deleting Buckets and Objects
----------------------------

DreamObjects supports deleting both objects and buckets via the S3 API.
Let's try and delete our bucket.

Press ENTER to continue...

Deleting bucket...
send: 'DELETE / HTTP/1.1\r\nHost: 3c7478c6-6684-4a8d-9179-8e1390d73623.objects.dreamhost.com\r\nAccept-Encoding: identity\r\nDate: Wed, 18 Jul 2012 21:45:35 GMT\r\nContent-Length: 0\r\nAuthorization: AWS a908asdf987asd897a:asdf098asdf987asdf7/B/3tAOU=\r\nUser-Agent: Boto/2.3.0 (darwin)\r\n\r\n'
reply: 'HTTP/1.1 409 Conflict\r\n'
header: Date: Wed, 18 Jul 2012 21:45:35 GMT
header: Server: Apache
header: Accept-Ranges: bytes
header: Content-Length: 80
header: Connection: close
header: Content-Type: application/xml
-> The bucket could not be deleted because it still contains an object!
-> success!

Let's delete the object in the bucket, so that we can then delete
the bucket.

Press ENTER to continue...

Deleting object...
send: 'DELETE /dreamhost-logo.png HTTP/1.1\r\nHost: 3c7478c6-6684-4a8d-9179-8e1390d73623.objects.dreamhost.com\r\nAccept-Encoding: identity\r\nDate: Wed, 18 Jul 2012 21:45:36 GMT\r\nContent-Length: 0\r\nAuthorization: AWS asd9f87as9d8f7asdf9807:asd798asdf987asdf=\r\nUser-Agent: Boto/2.3.0 (darwin)\r\n\r\n'
reply: 'HTTP/1.1 204 No Content\r\n'
header: Date: Wed, 18 Jul 2012 21:45:36 GMT
header: Server: Apache
header: Connection: close
header: Content-Type: application/xml
-> success!

Let's prove that the object is gone by trying to view it in our
browser.

Press ENTER to continue...

Re-opening object URL...
-> success!

Finally, let's clean up after ourselves and delete the bucket.

Press ENTER to continue...

Deleting bucket...
send: 'DELETE / HTTP/1.1\r\nHost: 3c7478c6-6684-4a8d-9179-8e1390d73623.objects.dreamhost.com\r\nAccept-Encoding: identity\r\nDate: Wed, 18 Jul 2012 21:45:44 GMT\r\nContent-Length: 0\r\nAuthorization: AWS asd90f8asdf897asdf897:asdf98asdf897asdf+mdrC9ilIA=\r\nUser-Agent: Boto/2.3.0 (darwin)\r\n\r\n'
reply: 'HTTP/1.1 204 No Content\r\n'
header: Date: Wed, 18 Jul 2012 21:45:44 GMT
header: Server: Apache
header: Connection: close
header: Content-Type: application/xml
-> success!

Let's prove that the bucket is gone by trying to view it in our
browser.

Press ENTER to continue...

Re-opening object URL (again)...
-> success!
