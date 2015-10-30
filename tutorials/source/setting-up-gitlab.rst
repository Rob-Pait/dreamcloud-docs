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
to do it for you. After the instance is running , give it

Installing Gitlab
-----------------
Once you have an Ubuntu 14.04 instance running, ssh in with

.. code-block:: shell

    ssh dhc-user@floating ip

then run

.. code-block:: shell

    sudo apt-get install curl openssh-server ca-certificates postfix

and follow the instructions to install postfix.

.. code-block:: shell

    curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
    sudo apt-get install gitlab-ce

This command curls a url and then runs every command in that url as root. and
because of this, you should use it with great caution. You should really never
run that command unless you are 100% confident that the url doesnt have
anything malitious in it. In this case it is the easiest way to install
gitlab-ce.

Configuration
-------------
.. code-block:: shell

    sudo gitlab-ctl reconfigure

Congrats, you are now running gitlab. Before you run away, login to the web
page in a browser (using your instances ip as the url), and login with the
credentials

Username: root
Password: 5iveL!fe

and change the password for root.
