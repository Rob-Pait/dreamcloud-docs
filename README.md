# DreamCloud-docs
Documentation for users of all DreamCloud products (DreamCompute,
DreamObjects, etc). Aimed at developers who wish to learn how to use
DreamCloud standard APIs to automate common tasks.

The documentation is organized by product and level of knowledge
required to understand the documentation:

 - dreamcompute
   - getstarted
   - tutorials
 - dreamobjects
   - getstarted
   - tutorials
 - dreamspeed
   - getstarted
   - tutorials

Publishing to zendesk
---------------------
Use the publish.py script in the repo to publish to zendesk. It requires a few
environment variables to be set:
 - ZENDESK\_PASS is the password for zendesk
 - EMAIL is your email for zendesk
 - ZENDESK\_URL is the url for zendesk

You  need to have python2.7 and beautifulsoup4 installed

The script can then be called using:
python publish.py html\_to\_be\_published.html $SECTION\_ID
