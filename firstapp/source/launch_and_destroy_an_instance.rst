Launch an instance
~~~~~~~~~~~~~~~~~~

Use your selected image and flavor to create an instance.

.. note:: The following instance creation example assumes that you have a
          single-tenant network. If you receive the 'Exception: 400 Bad
          Request Multiple possible networks found, use a Network ID to be
          more specific' error, you have multiple-tenant networks. You
          must add a `networks` parameter to the call that creates the
          server. See :doc:`/appendix` for details.

Create the instance.

.. note:: Your SDK might call an instance a 'node' or 'server'.

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-6
        :end-before: step-7

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-6
        :end-before: step-7

    This code returns output like this:

    .. code-block:: python

        <Node: uuid=3c8fd6fc02916c26d75b5e9bfa53d8b1315671be, name=testing, state=PENDING, public_ips=[], private_ips=[], provider=OpenStack ...>

.. only:: openstacksdk

    .. code-block:: python

       args = {
           "name": "testing",
           "flavorRef": flavor,
           "imageRef": image,
       }
       instance = conn.compute.create_server(**args)

.. only:: pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-6
        :end-before: step-7

    This code returns output like this:

    .. code-block:: none

        0d7968dc-4bf4-4e01-b822-43c9c1080d77

.. only:: dotnet

    .. literalinclude:: ../samples/dotnet/getting_started.cs
        :language: c#
        :dedent: 3
        :start-after: step-6
        :end-before: step-7

    This code returns output like this:

    .. code-block:: none

        Instance Id: 4e480ef1-68f0-491f-b237-d9b7f500ef24 at net.openstack.Core.Domain.Link[]

.. only:: shade

    .. literalinclude:: ../samples/shade/getting_started.py
        :start-after: step-6
        :end-before: step-7

If you list existing instances:

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-7
        :end-before: step-8

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-7
        :end-before: step-8

.. only:: pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-7
        :end-before: step-8

.. only:: dotnet

    .. literalinclude:: ../samples/dotnet/getting_started.cs
        :language: c#
        :dedent: 3
        :start-after: step-7
        :end-before: step-8

.. only:: shade

    .. literalinclude:: ../samples/shade/getting_started.py
        :start-after: step-7
        :end-before: step-8


The new instance appears.

.. only:: libcloud

    .. code-block:: python

        <Node: uuid=3c8fd6fc02916c26d75b5e9bfa53d8b1315671be, name=testing, state=RUNNING, public_ips=[], private_ips=[], provider=OpenStack ...>

.. only:: openstacksdk

    .. code-block:: python

       instances = conn.compute.list_servers()
       for instance in instances:
           print(instance)

.. only:: pkgcloud

    .. code-block:: none

        ...
        id: '0d7968dc-4bf4-4e01-b822-43c9c1080d77',
        name: 'testing',
        status: 'PROVISIONING',
        progress: 0,
        imageId: '2cccbea0-cea9-4f86-a3ed-065c652adda5',
        adminPass: undefined,
        addresses: {},
        metadata: {},
        flavorId: '3',
        hostId: 'b6ee757ed678e8c6589ae8cce405eeded89ac914daec73e45a5c50b8',
        created: '2015-06-30T08:17:39Z',
        updated: '2015-06-30T08:17:44Z',
        ...

.. only:: dotnet

    .. code-block:: none

        Instance Id: 4e480ef1-68f0-491f-b237-d9b7f500ef24 at net.openstack.Core.Domain.Link[]

.. only:: shade

   .. code-block:: none

       HUMAN_ID: true
        NAME_ATTR: name
        OS-DCF:diskConfig: MANUAL
        OS-EXT-AZ:availability_zone: iad-1
        OS-EXT-STS:power_state: 1
        OS-EXT-STS:task_state: null
        OS-EXT-STS:vm_state: active
        OS-SRV-USG:launched_at: '2015-07-20T20:31:10.000000'
        OS-SRV-USG:terminated_at: null
        accessIPv4: ''
        accessIPv6: ''
        addresses:
            private-network:
            -   OS-EXT-IPS-MAC:mac_addr: fa:16:3e:60:f5:cd
                OS-EXT-IPS:type: fixed
                addr: 2607:f298:6050:4e14:f816:3eff:fe60:f5cd
                version: 6
            -   OS-EXT-IPS-MAC:mac_addr: fa:16:3e:60:f5:cd
                OS-EXT-IPS:type: fixed
                addr: 10.10.10.14
                version: 4
        config_drive: ''
        created: '2015-07-20T20:30:23Z'
        flavor:
            id: '100'
            links:
            -   href:
                https://compute.dream.io:8774/5d013ac5962749a49af7ff18c2fb228c/flavors/100
                rel: bookmark
        hostId: f71865b497e6fa71063e292b11846eb64b5a41cd5c00fbb7465b6a48
        human_id: testing
        id: 67ecebdc-daff-4d84-bd04-bc76c67b48ec
        image:
            id: c55094e9-699c-4da9-95b4-2e2e75f4c66e
            links:
            -   href:
                https://compute.dream.io:8774/5d013ac5962749a49af7ff18c2fb228c/images/c55094e9-699c-4da9-95b4-2e2e75f4c66e
                rel: bookmark
        key_name: null
        links:
        -   href:
            https://compute.dream.io:8774/v2/5d013ac5962749a49af7ff18c2fb228c/servers/67ecebdc-daff-4d84-bd04-bc76c67b48ec
            rel: self
        -   href:
            https://compute.dream.io:8774/5d013ac5962749a49af7ff18c2fb228c/servers/67ecebdc-daff-4d84-bd04-bc76c67b48ec
            rel: bookmark
        metadata: {}
        name: testing
        networks:
            private-network:
            - 2607:f298:6050:4e14:f816:3eff:fe60:f5cd
            - 10.10.10.14
        os-extended-volumes:volumes_attached: []
        progress: 0
        security_groups:
        -   name: default
        status: ACTIVE
        tenant_id: 5d013ac5962749a49af7ff18c2fb228c
        updated: '2015-07-20T20:31:10Z'
        user_id: bfd3dbf1c8a242cd90884408de547bb9

Before you continue, you must do one more thing.

Destroy an instance
~~~~~~~~~~~~~~~~~~~

Cloud resources such as running instances that you no longer use can cost
money. Destroy cloud resources to avoid unexpected expenses.

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-8
        :end-before: step-9

.. only:: libcloud

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-8
        :end-before: step-9

.. only:: pkgcloud

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-8
        :end-before: step-9

.. only:: dotnet

    .. literalinclude:: ../samples/dotnet/getting_started.cs
        :language: c#
        :dedent: 3
        :start-after: step-8
        :end-before: step-9

.. only:: shade

    .. literalinclude:: ../samples/shade/getting_started.py
        :start-after: step-8
        :end-before: step-9

If you list the instances again, the instance disappears.

Leave your shell open to use it for another instance deployment in this
section.

