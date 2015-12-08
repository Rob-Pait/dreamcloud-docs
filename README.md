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

Publishing to zendesk
---------------------
Use the publish.py script in the https://github.com/dreamhost/zendesk-publish-script
Instructions are in that repo on how to publish to zendesk

Building the Documentation
--------------------------
run `tox` in the repo to build the documentation, the build directories are in
$category/$section/build.
For example, the dreamcompute tutorials documentation will be built to
"dreamcompute/tutorials/build"
