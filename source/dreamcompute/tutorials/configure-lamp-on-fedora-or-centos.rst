==============================================================
How to Configure LAMP on DreamCompute running Fedora or Centos
==============================================================

LAMP (Linux, Apache, MySQL, PHP) stacks are a popular way to create web service solutions that offer consistent tools and capabilities between multiple systems.  DreamHost shared, VPS and dedicated hosting services are based on these same services, and you can use it for your DreamCompute instance as well.  These instructions assume you run a Fedora- or CentOS-based system as they have their own specific configuration and file hierarchy.

Installation
~~~~~~~~~~~~

Install Apache with the following command:

.. code::

    yum install httpd

Apache can be started and the system told to start it on boot with the commands:

.. code::

    service httpd start
    chkconfig httpd on

Install MySQL client and server with the following command:

.. code::

    yum install mysql mysql-server

MySQL can be started and the system told to start it on boot with these commands:

.. code::

    service mysqld start
    chkconfig mysqld on
    chkconfig mariadb on

Both operating systems use "mysqld" for the service start.  For the chkconfig, CentOS uses "mysqld" because it still runs official MySQL packages and Fedora uses "mariadb" because it uses the MariaDB MySQL packages.

PHP can be installed with the following command:

.. code::

    yum install php php-mysql

There is no startup script for php.

This concludes the installation portion of this process.

Configuration
~~~~~~~~~~~~~

The below links contain details on the configuration of each part of the newly installed LAMP stack.

`Apache Directories and Main Configuration Files`_

.. `MySQL Configuration`_

`PHP Configuration Files`_

.. _Apache Directories and Main Configuration Files: https://dreamhosthelp.zendesk.com/hc/en-us/articles/215231178-How-to-Configure-Apache-on-DreamCompute-Running-Fedora-or-Centos

.. _MySQL Configuration:

.. _PHP Configuration Files: https://dreamhosthelp.zendesk.com/hc/en-us/articles/215231208-How-to-Configure-PHP-on-DreamCompute-running-Fedora-or-Centos
