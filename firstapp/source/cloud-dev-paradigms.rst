===========================
Cloud development paradigms
===========================

This section introduces the application architecture and explains how it was
designed to take advantage of cloud features in general and OpenStack in
particular. It also describes some commands in the previous section.

.. todo:: (for Nick) Improve the architecture discussion.

.. only:: dotnet

    .. warning:: This section has not yet been completed for the .NET SDK.

.. only:: fog

    .. warning:: This section has not yet been completed for the fog SDK.

.. only:: jclouds

    .. warning:: This section has not yet been completed for the jclouds SDK.

.. only:: pkgcloud

    .. warning:: This section has not yet been completed for the pkgcloud SDK.

.. only:: openstacksdk

    .. warning:: This section has not yet been completed for the OpenStack SDK.

.. only:: phpopencloud

    .. warning:: This section has not yet been completed for the
                 PHP-OpenCloud SDK.


Cloud application architecture principles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Cloud applications typically share several design principles.
These principles influenced the design of the Fractals application.

.. todo:: Do you want to state the core design principles or assume
          the reader can follow below.


Modularity and micro-services
-----------------------------

`Micro-services <http://en.wikipedia.org/wiki/Microservices>`_ are an
important design pattern that helps achieve application modularity. Separating
logical application functions into independent services simplifies maintenance
and re-use. Decoupling components also makes it easier to selectively scale
individual components, as required. Further, application modularity is a
required feature of applications that scale out well and are fault tolerant.

Scalability
-----------

Cloud applications often use many small instances rather than a few large
instances. Provided that an application is sufficiently modular, you can
easily distribute micro-services across as many instances as required. This
architecture enables an application to grow past the limit imposed by the
maximum size of an instance. It's like trying to move a large number of people
from one place to another; there's only so many people you can put on the
largest bus, but you can use an unlimited number of buses or small cars, which
provide just the capacity you need - and no more.

Fault tolerance
---------------

In cloud programming, there's a well-known analogy known as "cattle vs
pets". If you haven't heard it before, it goes like this:

When you're dealing with pets, you name them and care for them and if
they get sick, you nurse them back to health. Nursing pets back to
health can be difficult and very time consuming. When you're dealing
with cattle, you attach a numbered tag to their ear and if they get
sick you put them down and move on.

That, as it happens, is the new reality of programming. Applications
and systems used to be created on large, expensive servers, cared for
by operations staff dedicated to keeping them healthy. If something
went wrong with one of those servers, the staff's job was to do
whatever it took to make it right again and save the server and the
application.

In cloud programming, it's very different. Rather than large,
expensive servers, you're dealing with virtual machines that are
literally disposable; if something goes wrong, you shut it down and
spin up a new one. There's still operations staff, but rather than
nursing individual servers back to health, their job is to monitor the
health of the overall system.

There are definite advantages to this architecture. It's easy to get a
"new" server, without any of the issues that inevitably arise when a
server has been up and running for months, or even years.

As with classical infrastructure, failures of the underpinning cloud
infrastructure (hardware, networks, and software) are
unavoidable. When you're designing for the cloud, it's crucial that
your application is designed for an environment where failures can
happen at any moment. This may sound like a liability, but it's not;
by designing your application with a high degree of fault tolerance,
you're also making it resilient in the face of change, and therefore
more adaptable.

Fault tolerance is essential to the cloud-based application.

Automation
----------

If an application is meant to automatically scale up and down to meet
demand, it is not feasible have any manual steps in the process of
deploying any component of the application. Automation also decreases
the time to recovery for your application in the event of component
failures, increasing fault tolerance and resilience.

Programmatic interfaces (APIs)
------------------------------

Like many cloud applications, the Fractals application has a
`RESTful API <http://en.wikipedia.org/wiki/Representational_state_transfer>`_.
You can connect to it directly and generate fractals, or you can integrate it
as a component of a larger application. Any time a standard interface such as
an API is available, automated testing becomes much more feasible, increasing
software quality.
