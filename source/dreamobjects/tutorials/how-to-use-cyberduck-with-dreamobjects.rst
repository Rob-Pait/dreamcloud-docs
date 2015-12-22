======================================
How to Use Cyberduck with DreamObjects
======================================

Overview
~~~~~~~~

`Cyberduck <http://cyberduck.io>`_ is  an FTP, SFTP, and WebDav client as well as a cloud storage browser for Mac and Windows. You can use Cyberduck to connect to your DreamObjects account.

The following describes how to use Cyberduck to connect to your DreamObjects account.

How to use Cyberduck with DreamObjects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can set up your DreamObjects connection inside Cyberduck in two ways:

* Semi-automatically by downloading a preconfigured connection profile.
* Manually by creating a new profile.

Before you can connect CyberDuck with DreamObjects, you must enable DreamObjects and create the required user and keys. If you haven't already completed this step, please visit the following page for further information:

* [[DreamObjects_End_User_Guide#How_do_I_use_it.3F|How to use DreamObjects]]

Connecting Cyberduck with DreamObjects semi-automatically using a connection profile
------------------------------------------------------------------------------------

1. Download the `DreamObjects Connection Profile <http://applications.objects.dreamhost.com/DreamObjects.cyberduckprofile>`_.
2. Once it’s downloaded, double-click the file to open Cyberduck and then create a new DreamObjects bookmark.

    *The following window appears when Cyberduck opens:*

    .. figure:: images/01_DHO_Cyberduck.fw.png

    *If you wish to use a different nickname for the connection, you can update the nickname. Updating the connection nickname will also prevent Cyberduck from displaying the connection URL in the window title:*

    .. figure:: images/02_DHO_Cyberduck.fw.png

3. In the ‘Username’ field, enter the access key for the DreamObjects user/buckets to which you wish to connect.
4. Close the window to save the connection.

    .. figure:: images/03_DHO_Cyberduck.fw.png

5. Double-click the DreamObjects bookmark you just created, and then enter your Secret Key when prompted.
6. Click the **Login** button to log in to DreamObjects.
    * If you are using a Mac, the ‘Add to Keychain’ option appears. If you choose to add the information to your keychain, you will not be prompted for your Secret Key in the future.

      *Upon successful connection, your buckets appear listed as drives in the interface:*

    .. figure:: images/03_DHO_Cyberduck_SAME.fw.png

Connecting to Cyberduck manually
--------------------------------

1. Open Cyberduck.

    .. figure:: images/04_DHO_Cyberduck.fw.png

2. Create a new bookmark.

    .. figure:: images/05_DHO_Cyberduck.fw.png

3. Click the connection menu, and then select 'S3 (Amazon Simple Storage Service)' from the protocol drop down list.

    *You can use a different nickname for the connection. Updating the connection nickname will also prevent Cyberduck from displaying the connection URL in the window title:*

    .. figure:: images/02_DHO_Cyberduck.fw.png

4. Enter the following:
    * **Server**: objects.dreamhost.com
    * **Username**: enter the access key for the DreamObjects user/buckets to which you wish to connect, and then close the window to save the connection settings.

    .. figure:: images/03_DHO_Cyberduck.fw.png

5. Double-click the DreamObjects bookmark you just created and enter your Secret Key when prompted. 
    * If you are using a Mac you’ll see an option to ‘Add to Keychain’. If you choose to add the information to your keychain, you will not be prompted for your Secret Key in the future.

      *Upon successful connection, your buckets appear listed as drives in the interface:*

    .. figure:: images/03_DHO_Cyberduck_SAME.fw.png

Managing DreamObjects data using Cyberduck
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Cyberduck makes it very simple to manage your data. Once you’ve connected to DreamObjects, simply click and drag files and folders to and from Cyberduck. 

    *When uploading or downloading files, a transfer window appears:*

    .. figure:: images/10_DHO_Cyberduck.fw.png
