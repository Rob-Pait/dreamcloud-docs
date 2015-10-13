.. only:: jclouds

    ===================================================================
    How to deploy an app in an OpenStack instance with Java and Jclouds
    ===================================================================

.. only:: fog

    ===============================================================
    How to deploy an app in an OpenStack instance with Ruby and Fog
    ===============================================================

.. only:: libcloud

    =============================================================================
    How to deploy an app in an OpenStack instance with Python and Apache Libcloud
    =============================================================================

.. only:: shade

    ===================================================================
    How to deploy an app in an OpenStack instance with Python and Shade
    ===================================================================

Now that you know how to create and destroy instances, you can deploy the
sample application. The instance that you create for the application is
similar to the first instance that you created, but this time, we'll briefly
introduce a few extra concepts.

.. note:: Internet connectivity from your cloud instance is required
          to download the application.

When you create an instance for the application, you'll want to give it a bit
more information than you supplied to the bare instance that you just created
and destroyed. We'll go into more detail in later sections, but for now,
simply create the following resources so that you can feed them to the
instance:

* A key pair. To access your instance, you must import an SSH public key into
  OpenStack to create a key pair. OpenStack installs this key pair on the new
  instance. Typically, your public key is written to :code:`.ssh/id_rsa.pub`. If
  you do not have an SSH public key file, follow
  `these instructions <https://help.github.com/articles/generating-ssh- keys/>`_ first.
  We'll cover these instructions in depth in :doc:`/introduction-to-fractal-app`.

.. only:: jclouds

    .. literalinclude:: ../samples/jclouds/JCloudsNova.java
        :start-after: step-9
        :end-before: step-10

.. only:: fog

    In the following example, :code:`pub_key_file` should be set to
    the location of your public SSH key file.

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-9
        :end-before: step-10


.. only:: libcloud

    In the following example, :code:`pub_key_file` should be set to
    the location of your public SSH key file.

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-9
        :end-before: step-10

    ::

       <KeyPair name=demokey fingerprint=aa:bb:cc... driver=OpenStack>

.. only:: pkgcloud

    In the following example, :code:`pub_key_file` should be set to
    the location of your public SSH key file.

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-9
        :end-before: step-10

.. only:: shade

    In the following example, :code:`pub_key_file` should be set to
    the location of your public SSH key file.

    .. literalinclude:: ../samples/shade/getting_started.py
        :start-after: step-9
        :end-before: step-10


* Network access. DreamCompute has a default security group that will
  work for our purposes. If you want, you can create another security
  group by following along below. This security group allows HTTP
  and SSH access.
  FIXME We'll go into more detail in :doc:`/introduction-to-fractal-app`.

.. only:: jclouds

    .. literalinclude:: ../samples/jclouds/JCloudsNova.java
        :start-after: step-10
        :end-before: step-11

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-10
        :end-before: step-11

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-10
        :end-before: step-11

.. only::  pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-10
        :end-before: step-11

.. only:: shade

    .. literalinclude:: ../samples/shade/getting_started.py
        :start-after: step-10
        :end-before: step-11

* User data. During instance creation, you can provide user data to OpenStack to
  configure instances after they boot. The cloud-init service applies the
  user data to an instance. You must pre-install the cloud-init service on your
  chosen image.
  FIXME We'll go into more detail in :doc:`/introduction-to-fractal-app`.

.. only:: jclouds

    .. code-block:: java

        String userdata = "#!/usr/bin/env bash\ncurl -L -s https://git.openstack.org/cgit/stackforge/faafo/plain/contrib/install.sh | bash -s -- -i faafo -i messaging -r api -r worker -r demo";

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-11
        :end-before: step-12

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-11
        :end-before: step-12

.. only:: pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-11
        :end-before: step-12

.. only:: shade

    .. literalinclude:: ../samples/shade/getting_started.py
        :start-after: step-11
        :end-before: step-12

Now, you can boot and configure the instance.

Boot and configure an instance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the image, flavor, key pair, and userdata to create an instance. After you
request the instance, wait for it to build.

.. only:: jclouds

    .. literalinclude:: ../samples/jclouds/JCloudsNova.java
        :start-after: step-12
        :end-before: step-13

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-12
        :end-before: step-13

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-12
        :end-before: step-13

.. only:: pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-12
        :end-before: step-13

.. only:: shade

    The shade framework can select and assign a free floating IP quickly

    .. literalinclude:: ../samples/shade/getting_started.py
        :start-after: step-12
        :end-before: step-13

When the instance boots, the `ex_userdata` variable value instructs the
instance to deploy the Fractals application.

Associate a floating IP for external connectivity
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We'll cover networking in detail in :doc:`/networking`.

To see the application running, you must know where to look for it. By
default, your instance has outbound network access. To make your instance
reachable from the Internet, you need an IP address. By default in some cases,
your instance is provisioned with a publicly rout-able IP address. In this
case, you'll see an IP address listed under `public_ips` or `private_ips` when
you list the instances. If not, you must create and attach a floating IP
address to your instance.

.. only:: jclouds

    .. literalinclude:: ../samples/jclouds/JCloudsNova.java
        :start-after: step-13
        :end-before: step-14

    This will get an ip address that you can assign to your instance
    with:

    .. literalinclude:: ../samples/jclouds/JCloudsNova.java
        :start-after: step-14
        :end-before: step-15

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-13
        :end-before: step-14

    This will get an ip address that you can assign to your instance
    with:

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-14
        :end-before: step-15

.. only:: libcloud

    Use :code:`ex_list_floating_ip_pools()` and select the first floating IP
    address pool. Allocate this pool to your project and attach it to your
    instance.

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-13
        :end-before: step-14

    This code returns the floating IP address:

    ::

        <OpenStack_1_1_FloatingIpAddress: id=4536ed1e-4374-4d7f-b02c-c3be2cb09b67, ip_addr=203.0.113.101, pool=<OpenStack_1_1_FloatingIpPool: name=floating001>, driver=<libcloud.compute.drivers.openstack.OpenStack_1_1_NodeDriver object at 0x1310b50>>

    You can then attach it to the instance:

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-14
        :end-before: step-15


.. only:: pkgcloud

    Use :code:`getFloatingIps` to check for unused addresses, selecting the
    first one if available, otherwise use :code:`allocateNewFloatingIp` to
    allocate a new Floating IP to your project from the default address pool.

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-13
        :end-before: step-14

    This code returns the floating IP address:

    ::

        203.0.113.101

    You can then attach it to the instance:

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-14
        :end-before: step-15

.. only:: shade

    .. literalinclude:: ../samples/shade/getting_started.py
        :start-after: step-13
        :end-before: step-14


Run the script to start the deployment.

Access the application
~~~~~~~~~~~~~~~~~~~~~~

Deploying application data and configuration to the instance can take some
time. Consider enjoying a cup of coffee while you wait. After the application
deploys, you can visit the awesome graphic interface at the following link
by using your preferred browser.

.. only:: jclouds

    .. literalinclude:: ../samples/jclouds/JCloudsNova.java
        :start-after: step-15

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-15

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-15

.. only:: pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-15

.. only:: shade

    .. literalinclude:: ../samples/shade/getting_started.py
        :start-after: step-15

.. note:: If you do not use floating IPs, substitute another IP address as appropriate

.. figure:: images/screenshot_webinterface.png
    :width: 800px
    :align: center
    :height: 600px
    :alt: screenshot of the webinterface
    :figclass: align-center

Complete code sample
~~~~~~~~~~~~~~~~~~~~

The following file contains all of the code from this section of the
tutorial. This comprehensive code sample lets you view and run the code
as a single script.

Before you run this script, confirm that you have set your authentication
information, the flavor ID, and image ID.

.. only:: jclouds

    .. literalinclude:: ../samples/jclouds/JCloudsNova.java
       :language: java

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
       :language: ruby

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
       :language: python

.. only:: pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
       :language: javascript

.. only:: dotnet

    .. literalinclude:: ../samples/dotnet/getting_started.cs
       :language: c#

.. only:: shade

    .. literalinclude:: ../samples/shade/getting_started.py
       :language: python
