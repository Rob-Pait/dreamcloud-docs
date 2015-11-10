===================================
How to setup Gitlab on DreamCompute
===================================

Setting up
----------
Before you can put Gitlab on a DreamCompute instance, you must first have an
instance running. I recommend launching an Ubuntu 14.04 instance, the
instructions that we will be following may also work for other Debian based
distros, although I have not tested that. You can spin up an instance using the
Web UI (the smallest flavor should be fine), I recommend writing a small script
to do it for you, but you can also launch the instance from the web UI. After
the instance is running , give it an IP and then proceed.

Installing Gitlab
-----------------
Once you have an Ubuntu 14.04 instance running, ssh in with

.. code-block:: shell

    ssh dhc-user@floatingip

replacing "floatingip" with the ip address of your instance, then run

.. code-block:: shell

    sudo apt-get install curl openssh-server ca-certificates postfix

In the postfix installer, select "Internet site".

.. code-block:: shell

    curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
    sudo apt-get install gitlab-ce

This command curls a url and then runs every command in that url as root. and
because of this, you should use it with great caution. You should really never
run that command unless you are 100% confident that the url doesnt have
anything malitious in it. In this case it is the easiest way to install
gitlab-ce. If you are uncomfortable with this method of installation, you can
go to https://packages.gitlab.com/gitlab/gitlab-ce , click on the version you
want, copy the url for the download, then run the following commands.

.. code-block:: shell

    curl -LJO $url
    sudo dpkg -i $debfile

The url should look something like
https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/precise/gitlab-ce_8.1.2-ce.0_amd64.deb/download
and the filename should start with "gitlab-ce" and end with ".deb".

Configuration
-------------
.. code-block:: shell

    sudo gitlab-ctl reconfigure

Congrats, you are now running gitlab. The last thing you need to do is login to the web
page in a browser (using your instance's ip as the url), and login with the
credentials

Username: root
Password: 5iveL!fe

and change the password for root.
