Flavors and images
~~~~~~~~~~~~~~~~~~

To run your application, you must launch an instance. This instance serves as
a virtual machine.

To launch an instance, you choose a flavor and an image. The flavor represents
the size of the instance, including the number of CPUs and amount of RAM and
disk space. An image is a prepared OS installation from which you clone your
instance. When you boot instances in a public cloud, larger flavors can be
more expensive than smaller ones in terms of resources and monetary cost.

To list the images that are available in your cloud, run some API calls:

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-2
        :end-before: step-3

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-2
        :end-before: step-3

    This code returns output like this:

    .. code-block:: python

        <NodeImage: id=e81771c0-2944-405c-ba92-3deb0e1b4ce3, name=CentOS-7.0, driver=OpenStack  ...>
        <NodeImage: id=90d5e049-aaed-4abc-aa75-60c2b1ed6516, name=Ubuntu-14.04, driver=OpenStack  ...>
        <NodeImage: id=f044ae8f-e0e1-4fb4-baff-0363c19a6638, name=CoreOS, driver=OpenStack  ...>
        <NodeImage: id=2827d7cc-8cbb-4ce9-9b61-dadc2436144e, name=Fedora-20, driver=OpenStack  ...>
        <NodeImage: id=42a0101d-31c1-4c09-a70d-8f75f887ee27, name=Fedora-21, driver=OpenStack  ...>
        <NodeImage: id=683e165f-96b1-4ee5-8747-d15aade0dbff, name=CentOS-6.6, driver=OpenStack  ...>
        <NodeImage: id=de4d521b-6630-4361-8b9a-b2fa640cdfa0, name=CentOS-6.5, driver=OpenStack  ...>
        <NodeImage: id=5011c04a-f760-4dc5-9772-7e30d98647e6, name=Ubuntu-12.04-Precise, driver=OpenStack  ...>
        <NodeImage: id=b4efbc2a-6130-4f2e-b436-55a618c4de20, name=Debian-7.0-Wheezy, driver=OpenStack  ...>

.. only:: pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-2
        :end-before: step-3

    This code returns output like this:

    .. code-block:: none

        id: 6c7f5627-ca40-4781-ac34-4d9af53d4b29
        name: Fedora 22 - Updated
        created: 2015-08-17T03:53:17Z
        updated: 2015-08-17T04:53:12Z
        status: ACTIVE

        ...
        id: 2cccbea0-cea9-4f86-a3ed-065c652adda5
        name: Ubuntu 14.04
        created: 2015-08-13T02:25:10Z
        updated: 2015-08-13T02:43:38Z
        status: ACTIVE

.. only:: dotnet

    .. literalinclude:: ../samples/dotnet/getting_started.cs
        :language: c#
        :dedent: 3
        :start-after: step-2
        :end-before: step-3

    This code returns output like this:

    .. code-block:: none

        Image Id: dce1a289-2ad5-4aaa-a7a6-fe30adc2094e - Image Name: snap1
        Image Id: 97f55846-6ea5-4e9d-b437-bda97586bd0c - Image Name: cirros-0.3.4-x86_64-uec
        Image Id: 3e0e8270-0da4-4fec-bfc7-eeb763604cad - Image Name: cirros-0.3.4-x86_64-uec-ramdisk
        Image Id: 0b151382-d2f1-44d7-835b-6408bd523917 - Image Name: cirros-0.3.4-x86_64-uec-kernel

.. only:: shade

    .. literalinclude:: ../samples/shade/getting_started.py
        :language: python
        :start-after: step-2
        :end-before: step-3

    This code returns output like this:

    .. code-block:: none

        checksum: 750a56555d4ec7303f5dc33b007ff632
        container_format: bare
        created_at: '2014-07-14T19:02:15Z'
        direct_url:
        rbd://7e14670e-a6f8-445b-b632-4b79bafc4781/masseffect-images/b4efbc2a-6130-4f2e-b436-55a618c4de20/snap
        disk_format: raw
        file: /v2/images/b4efbc2a-6130-4f2e-b436-55a618c4de20/file
        id: b4efbc2a-6130-4f2e-b436-55a618c4de20
        min_disk: 10
        min_ram: 1024
        name: Debian-7.0-Wheezy
        owner: 0bacd8121bb548698f340455b38bf561
        protected: false
        schema: /v2/schemas/image
        size: 5242880000
        status: active
        tags: []
        updated_at: '2014-10-15T22:42:52Z'
        visibility: public


You can also get information about available flavors:

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-3
        :end-before: step-4

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-3
        :end-before: step-4

    This code returns output like this:

    .. code-block:: python

        <OpenStackNodeSize: id=100, name=subsonic, ram=1024, disk=80, bandwidth=None, price=0.0, driver=OpenStack, vcpus=1,  ...>
        <OpenStackNodeSize: id=200, name=supersonic, ram=2048, disk=80, bandwidth=None, price=0.0, driver=OpenStack, vcpus=1,  ...>
        <OpenStackNodeSize: id=300, name=lightspeed, ram=4096, disk=80, bandwidth=None, price=0.0, driver=OpenStack, vcpus=2,  ...>
        <OpenStackNodeSize: id=400, name=warpspeed, ram=8192, disk=80, bandwidth=None, price=0.0, driver=OpenStack, vcpus=4,  ...>
        <OpenStackNodeSize: id=500, name=hyperspeed, ram=16384, disk=80, bandwidth=None, price=0.0, driver=OpenStack, vcpus=8,  ...>
        <OpenStackNodeSize: id=600, name=ridiculous, ram=32768, disk=80, bandwidth=None, price=0.0, driver=OpenStack, vcpus=16,  ...>
        <OpenStackNodeSize: id=700, name=ludicrous, ram=65536, disk=80, bandwidth=None, price=0.0, driver=OpenStack, vcpus=32,  ...>
        <OpenStackNodeSize: id=800, name=plaid, ram=131072, disk=80, bandwidth=None, price=0.0, driver=OpenStack, vcpus=64,  ...>

.. only:: pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-3
        :end-before: step-4

    This code returns output like this:

    .. code-block:: none

        id: c46104de-d5fd-4567-ab0b-3dcfd117bd99
        name: m2.xlarge
        ram: 49152
        disk: 30
        vcpus: 12

        ...
        id: cba9ea52-8e90-468b-b8c2-777a94d81ed3
        name: m1.small
        ram: 2048
        disk: 20
        vcpus: 1

.. only:: dotnet

    .. literalinclude:: ../samples/dotnet/getting_started.cs
        :language: c#
        :dedent: 3
        :start-after: step-3
        :end-before: step-4

    This code returns output like this:

    .. code-block:: none

        Flavor Id: 1 - Flavor Name: m1.tiny
        Flavor Id: 2 - Flavor Name: m1.small
        Flavor Id: 3 - Flavor Name: m1.medium
        Flavor Id: 4 - Flavor Name: m1.large
        Flavor Id: 42 - Flavor Name: m1.nano
        Flavor Id: 5 - Flavor Name: m1.xlarge
        Flavor Id: 84 - Flavor Name: m1.micro

.. only:: shade

    .. literalinclude:: ../samples/shade/getting_started.py
        :language: python
        :start-after: step-3
        :end-before: step-4

    This code returns output like this:

    .. code-block:: none

        HUMAN_ID: true
        NAME_ATTR: name
        OS-FLV-DISABLED:disabled: false
        OS-FLV-EXT-DATA:ephemeral: 0
        disk: 80
        ephemeral: 0
        human_id: supersonic
        id: '200'
        is_public: true
        links:
        -   href:
            https://compute.dream.io:8774/v2/5d013ac5962749a49af7ff18c2fb228c/flavors/200
            rel: self
        -   href:
            https://compute.dream.io:8774/5d013ac5962749a49af7ff18c2fb228c/flavors/200
            rel: bookmark
        name: supersonic
        os-flavor-access:is_public: true
        ram: 2048
        swap: ''
        vcpus: 1

Your images and flavors will be different, of course.

Choose an image and flavor for your instance. You need about 1GB RAM, 1 CPU,
and a 1GB disk. This example uses the Ubuntu image with a small
flavor, which is a safe choice. In subsequent tutorial sections in
this guide, you must change the image and flavor IDs to correspond to
the image and flavor that you choose.

If the image that you want is not available in your cloud, you can usually
upload one depending on your cloud's policy settings. For information about
how to upload images, see
`obtaining images <http://docs.openstack.org/image-guide/content/ch_obtaining_images.html>`_.

Set the image and size variables to appropriate values for your cloud. We'll
use these variables in later sections.

First, tell the connection to get a specified image by using the ID of the
image that you picked in the previous section:

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-4
        :end-before: step-5

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-4
        :end-before: step-5

    This code returns output like this:

    .. code-block:: python

        <NodeImage: id=90d5e049-aaed-4abc-aa75-60c2b1ed6516, name=Ubuntu-14.04, driver=OpenStack  ...>

.. only:: pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-4
        :end-before: step-5

    This code returns output like this:

    .. code-block:: none

        id: 2cccbea0-cea9-4f86-a3ed-065c652adda5
        name: Ubuntu 14.04
        created: 2015-08-13T02:25:10Z
        updated: 2015-08-13T02:43:38Z
        status: ACTIVE

.. only:: dotnet

    .. literalinclude:: ../samples/dotnet/getting_started.cs
        :language: c#
        :dedent: 3
        :start-after: step-4
        :end-before: step-5

    This code returns output like this:

    .. code-block:: none

        Image Id: 97f55846-6ea5-4e9d-b437-bda97586bd0c - Image Name: cirros-0.3.4-x86_64-uec

.. only:: shade

    .. literalinclude:: ../samples/shade/getting_started.py
        :start-after: step-4
        :end-before: step-5

    This code returns output like this:

    .. code-block:: none

        checksum: da578dd59289a35a0ac7744a0bd85cf5
        container_format: bare
        created_at: '2014-10-27T22:05:37Z'
        direct_url:
        rbd://7e14670e-a6f8-445b-b632-4b79bafc4781/masseffect-images/c55094e9-699c-4da9-95b4-2e2e75f4c66e/snap
        disk_format: raw
        file: /v2/images/c55094e9-699c-4da9-95b4-2e2e75f4c66e/file
        id: c55094e9-699c-4da9-95b4-2e2e75f4c66e
        min_disk: 0
        min_ram: 0
        name: Ubuntu-14.04-Trusty
        owner: 0bacd8121bb548698f340455b38bf561
        protected: false
        schema: /v2/schemas/image
        size: 10737418240
        status: active
        tags: []
        updated_at: '2014-10-27T22:08:55Z'
        visibility: public


Next, choose which flavor you want to use:

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-5
        :end-before: step-6

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-5
        :end-before: step-6

    This code returns output like this:

    .. code-block:: python

        <OpenStackNodeSize: id=100, name=subsonic, ram=1024, disk=80, bandwidth=None, price=0.0, driver=OpenStack, vcpus=1,  ...>

.. only:: pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-5
        :end-before: step-6

    This code returns output like this:

    .. code-block:: none


        id: cba9ea52-8e90-468b-b8c2-777a94d81ed3
        name: m1.small
        ram: 2048
        disk: 20
        vcpus: 1

.. only:: dotnet

    .. literalinclude:: ../samples/dotnet/getting_started.cs
        :language: c#
        :dedent: 3
        :start-after: step-5
        :end-before: step-6

    This code returns output like this:

    .. code-block:: none

        Flavor Id: 2 - Flavor Name: m1.small

.. only:: shade

    Because shade accepts either the ID or name in most API calls, specify the
    name for the flavor:

    .. literalinclude:: ../samples/shade/getting_started.py
        :start-after: step-5
        :end-before: step-6

    This code returns output like this:

    .. code-block:: none

        HUMAN_ID: true
        NAME_ATTR: name
        OS-FLV-DISABLED:disabled: false
        OS-FLV-EXT-DATA:ephemeral: 0
        disk: 80
        ephemeral: 0
        human_id: subsonic
        id: '100'
        is_public: true
        links:
        -   href:
            https://compute.dream.io:8774/v2/5d013ac5962749a49af7ff18c2fb228c/flavors/100
            rel: self
        -   href:
            https://compute.dream.io:8774/5d013ac5962749a49af7ff18c2fb228c/flavors/100
            rel: bookmark
        name: subsonic
        os-flavor-access:is_public: true
        ram: 1024
        swap: ''
        vcpus: 1

Now, you're ready to launch the instance.
