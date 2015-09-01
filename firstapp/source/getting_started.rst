===============
Getting started
===============

Who should read this guide
~~~~~~~~~~~~~~~~~~~~~~~~~~

This guide is for software developers who want to deploy applications to
DreamCompute, which is based on OpenStack.

We assume that you're an experienced programmer who has not created a cloud
application in general or an OpenStack application in particular.

If you're familiar with OpenStack, this section teaches you how to program
with its components.

What you will learn
~~~~~~~~~~~~~~~~~~~

Deploying applications in a cloud environment can be very different from
deploying them in a traditional IT environment. This guide teaches you how to
deploy applications on OpenStack and some best practices for cloud application
development.

A general overview
~~~~~~~~~~~~~~~~~~

This tutorial shows two applications. The first application is a simple
fractal generator that uses mathematical equations to generate beautiful
`fractal images <http://en.wikipedia.org/wiki/Fractal>`_. We show you this
application in its entirety so that you can compare it to a second, more
robust, application.

The second application is an OpenStack application that enables you to:

* Create and destroy compute resources. These resources are virtual
  machine instances where the Fractals application runs.
* Make cloud-related architecture decisions such as turning
  functions into micro-services and modularizing them.
* Scale available resources up and down.
* Use Object and Block storage for file and database persistence.
* Use Orchestration services to automatically adjust to the environment.
* Customize networking for better performance and segregation.
* Explore and apply advanced OpenStack cloud features.

Choose your OpenStack SDK
~~~~~~~~~~~~~~~~~~~~~~~~~

Anyone with a programming background can easily read the code in this guide.
Although this guide focuses on a particular SDK, you can use other languages
and toolkits with the OpenStack cloud:

============== ============= ================================================================= ====================================================
Language        Name          Description                                                       URL
============== ============= ================================================================= ====================================================
Python         Libcloud      A Python-based library managed by the Apache Foundation.
                             This library enables you to work with multiple types of clouds.   https://libcloud.apache.org
Python         OpenStack SDK A Python-based library specifically developed for OpenStack.      https://github.com/stackforge/python-openstacksdk
Python         Shade         A Python-based library developed by OpenStack Infra team to       https://github.com/openstack-infra/shade
                             operate multiple OpenStack clouds.
Java           jClouds       A Java-based library. Like Libcloud, it's also managed by the     https://jclouds.apache.org
                             Apache Foundation and works with multiple types of clouds.
Ruby           fog           A Ruby-based SDK for multiple clouds.                             https://github.com/fog/fog/blob/master/lib/fog/openstack/docs/getting_started.md
node.js        pkgcloud      A Node.js-based SDK for multiple clouds.                          https://github.com/pkgcloud/pkgcloud
PHP            php-opencloud A library for developers using PHP to work with OpenStack clouds. http://php-opencloud.com/
.NET Framework OpenStack SDK A .NET-based library enables you to write C++ or C# code for      https://www.nuget.org/packages/openstack.net
               for Microsoft Microsoft applications.
               .NET
============== ============= ================================================================= ====================================================

For a list of available SDKs, see `Software Development Kits <https://wiki.openstack.org/wiki/SDKs>`_.

Other versions of this guide show you how to use the other SDKs and
languages to complete these tasks. If you're a developer for another toolkit
that you would like this guide to include, feel free to submit code snippets.
You can contact `OpenStack Documentation team <https://wiki.openstack.org/Documentation>`_
members for more information.

