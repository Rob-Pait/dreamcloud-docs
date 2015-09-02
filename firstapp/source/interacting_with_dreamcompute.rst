.. only:: libcloud

    How to authenticate using Python and Apache Libcloud
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. only:: shade

    How to authenticate using Python and OpenStack Shade
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This tutorial will guide you with step-by-step instructions on how to
get a basic authentication token on DreamCompute and create a
connection. This is the most basic step to execute before any other
task.

You will need to have your username, password and project ID
available. This information can be easily retrieved from
`DreamCompute's dashboard, in the openrc file
<https://dashboard.dreamcompute.com/project/access_and_security/api_access/openrc/>`_.

.. only:: fog

    .. literalinclude:: ../samples/fog/getting_started.rb
        :start-after: step-1
        :end-before: step-2

.. only:: libcloud

    To try it, add the following code to a Python script (or use an
    interactive Python shell) by calling :code:`python -i`.

    .. literalinclude:: ../samples/libcloud/getting_started.py
        :start-after: step-1
        :end-before: step-2

.. only:: openstacksdk

    .. code-block:: python

      from openstack import connection
      conn = connection.Connection(auth_url="http://controller:5000/v3",
                                   user_name="your_auth_username",
                                   password="your_auth_password", ...)

.. only:: pkgcloud

    To try it, add the following code to a script (or use an
    interactive nodejs shell) by calling :code:`node`.

    .. literalinclude:: ../samples/pkgcloud/getting_started.js
        :start-after: step-1
        :end-before: step-2

.. only:: dotnet

    To use the OpenStack .NET SDK, add the following code in the required
    namespace section.

    .. code-block:: c#

        using net.openstack.Core.Domain;
        using net.openstack.Core.Providers;
        using net.openstack.Providers.Rackspace;

    Because all service endpoints use the Identity Service for authentication
    and authorization, place the following code in the 'void Main()'
    entry-point function.

    .. literalinclude:: ../samples/dotnet/getting_started.cs
        :language: c#
        :dedent: 3
        :start-after: step-1
        :end-before: step-2

This code creates the :code:`conn` object that you can use in the next
steps.

.. only:: libcloud

    .. note:: If you receive the
              :code:`libcloud.common.types.InvalidCredsError: 'Invalid
              credentials with the provider'` exception when you run
              one of these API calls, double-check your credentials.

.. only:: shade

    To try it, add the following code to a Python script (or use an
    interactive Python shell) by calling :code:`python -i`.

    Use your credentials above to specify the cloud provider name,
    user name, password, project_name and region_name in the file
    :file:`~/.config/openstack/clouds.yml`.

    .. literalinclude:: ../samples/shade/clouds.yml
        :language: yaml

    .. note:: If you do use a public cloud `known by shade
              <http://git.openstack.org/cgit/openstack/os-client-config/tree/os_client_config/vendors>`_,
              you can avoid specifying :code:`auth_url:` and instead specify
              :code:`profile: $PROVIDER_NAME` in the clouds.yml file.

    .. literalinclude::  ../samples/shade/getting_started.py
        :start-after: step-1
        :end-before: step-2

