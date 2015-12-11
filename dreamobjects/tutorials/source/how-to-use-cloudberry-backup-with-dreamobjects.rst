==============================================
How to Use CloudBerry Backup with DreamObjects
==============================================

Overview
~~~~~~~~

:[[File:Banner cloudberry1.png]]

[http://www.cloudberrylab.com/dreamobjects-tools.aspx CloudBerry Backup] is a Windows program that automates encrypted and compressed data cloud backup. 

This guide describes how to configure CloudBerry with DreamObjects.

==Setting up CloudBerry Backupup with DreamObjects==

<ol>
<li>Launch CloudBerry. 
:[[file:01_Cloudberry.fw.png]]
<li>Select the ‘Setup Backup Plan’ option.
:[[file:02_Cloudberry.fw.png]]
<li>Click the '''Next''' button.
:[[file:03_Cloudberry.fw.png]]
<li>In the ‘Select Cloud Storage’ window, select the ‘DreamObjects’ option and then ‘<Create a new account>’.
:[[file:04_Cloudberry.fw.png]]
<li>Enter the following  DreamObjects credentials which can be found on the ([https://panel.dreamhost.com/index.cgi?tree=cloud.objects& Panel > ‘Cloud Services’ > ‘DreamObjects’]) page:

*'''Display Name''' – Enter any name you wish
*'''Access Key''' – Under the username on the DreamObjects page for the specific bucket name
*'''Secret Key''' – To the left of the Access Key (also known as the password)
*'''Service Point''' – objects.dreamhost.com

{{Note2|After entering the required information, users are able to both access existing buckets and create new ones.}}

:''The new DreamObjects account now appears on the ‘Select Cloud Storage’ window:'' 
:[[file:05_Cloudberry.fw.png]]
<li>Click the '''Next''' button. 
:[[file:06_Cloudberry.fw.png]]
<li>Enter a backup 'Plan name'.
:[[file:07_Cloudberry.fw.png]]
<li>Select a backup mode.
:[[file:08_Cloudberry.fw.png]]
<li>Select whether you wish to use VSS (Volume Shadow Copy Service).
:[[file:09_Cloudberry.fw.png]]
<li>Select the location of the files and folders you wish to backup.
:[[file:10_Cloudberry.fw.png]]
<li>In the ‘Advanced Filter’ window, select whether to backup all files or specific types along with your choice of time frame. 
:[[file:11_Cloudberry.fw.png]]
<li>Check the check box to ‘Enable compression’. 
*You can also enable encryption if you want.
:[[file:12_Cloudberry.fw.png]]
<li>Select any Purge options you wish to set up. 
*Some Purge options aren't available unless ‘Advanced Mode’ is enabled.
:[[file:13_Cloudberry.fw.png]]
<li>Select time schedule options for your backups. 
:[[file:14_Cloudberry.fw.png]]
<li>Select whether you want to set pre or post actions for your backups. 
*You can skip this step if you like by clicking the '''Next''' button.
:[[file:15_Cloudberry.fw.png]]
<li>Select how you wish to be notified regarding the status of a backup.
*Include your email address in the email field
:[[file:16_Cloudberry.fw.png]]
<li>Confirm the settings on the summary page, and then click the '''Next''' button.
:''A confirmation page appears:''
:[[file:17_Cloudberry.fw.png]]
*You can run the backup now by checking the box, or you can click '''Finish''' to run it a later time.
:[[file:18_Cloudberry.fw.png]]
<li>Click the ‘Backup Plans’ tab to confirm everything is properly configured. 
<li>Click the '''Run backup now''' button if you want to run the backup. 
</ol>
