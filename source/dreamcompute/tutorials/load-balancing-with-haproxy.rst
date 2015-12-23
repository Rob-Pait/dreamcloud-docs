===========================================
Load Balancing on DreamCompute with HAProxy
===========================================

Introduction
~~~~~~~~~~~~

`DreamCompute <http://www.dreamhost.com/cloud/computing/>`_ provides you with
the ability to spin up virtual machines on a private virtual network. Each
virtual machine can be used to host one or more applications. While it is
possible to assign a unique floating IP to each of these applications, it is
sometimes desirable to host multiple applications behind the same IP address
to save cost. In addition, you may have applications that are horizontally
scaled out with instances running on multiple virtual machines.

Load balancers are designed to solve both of these problems. One of the most
popular open source load balancers is `HAProxy
<http://www.haproxy.org/HAProxy>`_. It is well supported, featureful, high
performing, and widely available.

In this tutorial, we will be creating a virtual machine inside of DreamCompute
that acts as a load balancer with HAProxy. We’ll be using Ubuntu 14.04 as the
base operating system image for our load balancer.

Prepping Your Virtual Machine
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Creating a virtual machine in DreamCompute is pretty easy. We have other
tutorials reviewing the process, but we’ll quickly review here.

Creating a Virtual Machine
--------------------------

To create a virtual machine:

1. Log in to the `DreamCompute Dashboard
   <https://dashboard.dreamcompute.com/>`_
2. Click the **Launch Instance** button from your instances tab.

    *The following dialog box appears:*

.. figure:: images/HAProxy_instance.fw.png

3. Create a "subsonic" instance, running on Ubuntu 14.04, naming it
   "load-balancer", and then click the **Launch** button.

.. figure:: images/HAProxy_launch_instance.fw.png

4. After you make the selections, click the **Networking** tab and then
   connect the VM to your private network.

.. figure:: images/HAProxy_launch_instance2.fw.png

5. Click the **Access & Security** tab to configure the security groups,
   ensuring that you are able to access the instance via HTTP (port 80) and
   SSH (port 22).

    * DreamCompute pre-configures a **default** security group for you --
      **make sure it's checked**.

6. Click the **Launch** button and wait for the instance to become available.
   This should take between 45 seconds to a few minutes.

    *Once your instance becomes available, you must associate a public IPv4
    "floating" IP address.*

.. figure:: images/HAProxy_instances_dash.fw.png

7. Click the **More** dropdown tab on in the Actions column of your instance
   list.

.. figure:: images/HAProxy_floating_ip.fw.png

8. Click **Associate Floating IP**.

    *The following dialog box appears:*

.. figure:: images/HAProxy_manage_floating_ip.fw.png

9. Allocate a floating IP with the port associated with the private IP address
   of your load balancer virtual machine, and then click the **Associate**
   button.

    * Once you've associated the IP address, give DreamCompute a few seconds
      to complete the association, and then you should be able to SSH into
      your instance via its IPv4 address.

.. figure:: images/HAProxy_SSH1.fw.png

10. SSH into your instance via its IPv4 address.

Now, we’re ready to get HAProxy installed and configured.

Install HAProxy
~~~~~~~~~~~~~~~

Updating Packages
-----------------

Before installing HAProxy, its important to be sure that your operating system
is up to date with the latest security fixes and packages available from
Ubuntu. While logged in as dhc-user, simply run:

.. code::

    sudo apt-get upgrade

Follow the prompts, and allow apt to update your system.

Installing HAProxy
------------------

.. code::

    sudo apt-get install haproxy

Configure HAProxy
~~~~~~~~~~~~~~~~~

For the purposes of our tutorial, we're going to assume that you have two
applications that you would like to deploy behind HAProxy. The first
application will be on a single virtual machine and the second application
will be horizontally scaled across two virtual machines.

When we are complete with our configuration, our deployment will look
something like this:

.. code::

    app1.domain.io
        |          +-------------+   10.10.10.2   +---------------+
        +--------->|             |--------------->|      app1     |
                   |   HAProxy   |                +---------------+
        +--------->|             |---+
        |          +-------------+   | 10.10.10.3 +---------------+
    app2.domain.io                   +----------->|    app2-a     |
                                     |            +---------------+
                                     |
                                     | 10.10.10.4 +---------------+
                                     +----------->|    app2-b     |
                                                  +---------------+

To support this deployment, edit your /etc/haproxy/haproxy.cfg:

.. code::

    global
    log /dev/log    local0
    log /dev/log    local1 notice
    chroot /var/lib/haproxy
    maxconn 4096
    user haproxy
    group haproxy
    daemon

    defaults
    log    global
    mode    http
    option    httplog
    option    dontlognull
    timeout connect 5000
    timeout client  50000
    timeout server  50000
    errorfile 400 /etc/haproxy/errors/400.http
    errorfile 403 /etc/haproxy/errors/403.http
    errorfile 408 /etc/haproxy/errors/408.http
    errorfile 500 /etc/haproxy/errors/500.http
    errorfile 502 /etc/haproxy/errors/502.http
    errorfile 503 /etc/haproxy/errors/503.http
    errorfile 504 /etc/haproxy/errors/504.http

    option forwardfor
    option http-server-close
    stats enable
    stats auth admin:stats
    stats uri /haproxyStats

    frontend http-in
    bind \*:80
    option forwardfor

    # Define hosts
    acl host_app_one hdr(host) -i app1.domain.io
    acl host_app_two hdr(host) -i app2.domain.io

    # Figure out which one to use
    use_backend app_one_cluster if host_app_one
    use_backend app_two_cluster if host_app_two

    backend app_one_cluster
    balance leastconn
    option httpclose
    server node1 10.10.10.2:80 cookie A check

    backend app_two_cluster
    balance leastconn
    option httpclose
    server node1 10.10.10.3:80 cookie A check
    server node2 10.10.10.4:80 cookie A check

Next, you'll need to activate HAProxy by setting ENABLED to 1 in
/etc/default/haproxy. Finally, you can run HAProxy:

.. code::

    sudo service haproxy restart

Assuming that you have configured your DNS to point app1.domain.io and
app2.domain.io to your floating IP address, you should be able to access your
applications via HAProxy. Congratulations!
