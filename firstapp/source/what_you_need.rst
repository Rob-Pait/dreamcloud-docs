===============
Getting started
===============

What you need
-------------

We assume that you already have access to DreamCompute. If so, you
have been assigned a project, sometimes called a tenant, which has a
maximum quota and for our purposes you will need to be able to create
at least six instances. Because the Fractals application runs in Ubuntu,
Debian, Fedora-based, and openSUSE-based distributions, you must create
instances that use one of these operating systems.

To interact with the cloud, you must also have

.. only:: dotnet

      `OpenStack Cloud SDK for Microsoft .NET 1.4.0.1 or later installed
      <https://www.nuget.org/packages/openstack.net>`_.

      .. note::

         To install the OpenStack .NET SDK, use the NeGet Package Manager that
         is included with Visual Studio and Xamarin Studio. You simply add a
         package named 'openstack.net' and the NeGet Package Manager
         automatically installs the necessary dependencies.

      .. warning::

         This document has not yet been completed for the .NET SDK.

.. only:: fog

      `fog 1.19 or higher installed
      <http://www.fogproject.org/wiki/index.php?title=FOGUserGuide#Installing_FOG>`_
      and working with ruby gems 1.9.

      .. warning::

         This document has not yet been completed for the fog SDK.

.. only:: jclouds

    `jClouds 1.8 or higher installed <https://jclouds.apache.org/start/install>`_.

    .. warning::

       This document has not yet been completed for the jclouds SDK.

.. only:: libcloud

  `libcloud 0.15.1 or higher installed
  <https://libcloud.apache.org/getting-started.html>`_.

.. only:: pkgcloud

      `pkgcloud 1.2 or higher installed
      <https://github.com/pkgcloud/pkgcloud#getting-started>`_.

     .. highlight:: javascript

.. only:: openstacksdk

    the OpenStack SDK installed.

    .. warning::

       This document has not yet been completed for the OpenStack SDK.

.. only:: phpopencloud

    `a recent version of php-opencloud installed <http://docs.php-opencloud.com/en/latest/>`_.

    .. warning::

       This document has not yet been completed for the php-opencloud SDK.

.. only:: shade

     `a recent version of shade library installed <https://pypi.python.org/pypi/shade/0.11.0>`_.

     .. note:: Before proceeding, install the latest version of shade.

Download the DreamCompute RC file from
https://dashboard.dreamcompute.com/project/access_and_security/api_access/openrc/
to obtain the following information.

* auth URL
* user name
* password
* project ID or name (projects are also known as tenants)
* cloud region

Be aware that the "auth URL" does not include the path. Your auth URL
should look like this.

.. code-block:: python

        https://keystone.dream.io/

