======================================
How to Use Duplicati with DreamObjects
======================================

Overview
~~~~~~~~

.. figure:: images/duplicati.png

`Duplicati <http://www.duplicati.com/home>`_ is a free backup client that
securely stores encrypted, incremental, compressed backups on cloud-storage
services and remote-file servers. It works with Linux, Mac, and Windows.

Duplicati has built-in AES-256 encryption and backups can be signed using GNU
Privacy Guard. A built-in scheduler ensures that backups are always
up-to-date. The Duplicati project was inspired by `duplicity
<http://duplicity.nongnu.org>`_, and while similar, they are not compatible.

Setting up Duplicati with DreamObjects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Launch Duplicati.
    *The following options appear when first setting up Duplicati:*

    .. figure:: images/01_Duplicati.fw.png

2. Select the ‘Setup a new backup’ option.

    .. figure:: images/02_Duplicati.fw.png

3. Enter a backup name, and then click the **Next** button.

    .. figure:: images/03_Duplicati.fw.png

4. Select which type of files you wish to back up, and then click the **Next**
   button.

    .. figure:: images/04_Duplicati.fw.png

5. Enter the following:
    * **Protect the backups with this password** - This is optional but
      recommended
    * **Encryption method** – Select AES 256
    * **Use these settings on new backups** - Check this box to enable these
      settings for future backups

6. Click the **Next** button.

    .. figure:: images/05_Duplicati.fw.png

7. Select the 'Amazon S3 based' radio button, and then click the **Next**
   button.

    .. figure:: images/06_Duplicati.fw.png

8. Enter the following required DreamObjects credentials:
    * **S3 Servername** – objects.dreamhost.com
    * **AWS Access ID and Secret Key** – Visit the
      [[DreamObjects_End_User_Guide#Keys|DreamObjects keys]] article for
      further details
    * **S3 Bucket name** – The name of your DreamObjects bucket

9. Click the **Next** button.

    .. figure:: images/07_Duplicati.fw.png

10. Select the desired Advanced settings, and then click the **Next** button.
     *A summary window appears where you can review details of the backup:*

    .. figure:: images/08_Duplicati.fw.png

10. Click the **Finish** button to save.
