=====================================
Backing up your phone to DreamObjects
=====================================

First, log into the DreamHost Panel Cloud Services → DreamObjects and select a
bucket. For the purposes of this tutorial, we’ll use the freshly created
“petesnexus4camera” bucket.

1

On your Android device, install S3Anywhere (there’s a free trial version of the
app if you don’t want to pay a few bucks for the Pro version linked here) and
open it.

2

Tap “Add” to add a new bucket connection.

3

Fill out the General form replacing petesnexus4camera with the name of your
bucket:

S3 URL: http://petesnexus4camera.objects.dreamhost.com – make sure your bucket
name does not contain underscore characters.

KeyID: Your S3 Access Key
SecretKey: Your S3 Secret Key [1]

Bucket: petesnexus4camera
Local Dir: leave as is
Remote Dir: leave as is (optionaly set to the root directory within a bucket:
“/”)

Resume: Check “Enable for Download.”
[1] Watch out for a “gotcha” here – S3Anywhere rejects keys containing some
characters like underscores.  Luckily It’s easy to generate new S3 keys through
the DreamHost Panel – if the app complains just click the “ADD KEY” button,
select S3 and try the new key.

4

If the app complains again – rinse, dry, and repeat until you get a key pair
the app accepts (it shouldn’t take many tries).

The complete configuration of the General section should look something like
this: [2]

5

[2] If you were trying to be clever and tried this exact S3 key pair and are
wondering why it didn’t work, it’s because I’ve already removed the key ;).

6

Tap 6 to fill out the Advanced tab settings:

7

Select from drop-downs:

Upload ACL: This setting will set the permissions of uploaded files. “Private”
or “Authenticated-read” are recommended, unless you’re a saint and/or an
absolute, “by the book” certified square. And we know you’re not.

Create Bucket: We’ve already created the bucket, so this isn’t needed.

Location: Select your location

Retry: You can have the uploads fail or you can have them retry several times
if something happens.

More: No need to go there.

Tap 8 to fill out the Sync tab settings:

9

Sync Type: Mirror local (Master is local folder)

This means that the bucket will be updated to reflect changes on your phone. If
you delete any photos on your phone and also want them to disappear from your
DreamObjects bucket, select the “Orphan: Delete discrepancies.”

Local dir: Click the “browse button” and navigate to the folder you want to
sync. On this example device, the Camera app stores the images in
/storage/emulated/0/DCIM/Camera/

Remote dir: Set this field to the root directory (“/”) of your bucket. You can
also set this field to a real or imagined directory path – they will get
created if they don’t already exist. Do not leave this field blank or the sync
won’t work.

Subfolders, Include (recursive): Check it – this ensures that any
subdirectories (such as Thumbnails created by the stock Android 4.x Camera app)
are also uploaded.

Orphan: When checked, the files deleted at the “Master” location (see “Sync
Type” above) will also be deleted at the sync destination.

“Network” and “Power” settings are self-explanatory.

Schedule: Allows you to set the frequency of automatic syncing. The example
setting is conservative, set to occur once every 24 hours at 1AM, because
that’s when your phone is most likely to be on your WiFi at home, charging
while you sleep. Please keep in mind that the more frequent the sync, the
higher battery consumption.

Woohoo! Now we are done with all the settings!

Hit “Save” and give your configuration a name (S3Anywhere will automatically
suggest your bucket as the name).

10

Hit OK on the confirmation.

11

Aaaand Done!

Well, almost. Since we’ve gone to all this trouble of setting up the sync, why
not have it sync right now?!

Easy.

Navigate your way back to the home S3Anywhere screen

12

Select your configuration from the dropdown menu. Hit “Sync.”

13

Hit “Proceed.”

Watch it rip.

Other goodies.
--------------

14

Another nice feature is the “Copy” option. It allows you to make an exact copy
of a configuration and edit it. This makes synching other folders on your
Android device to a DreamObjects bucket (under the same user) a breeze!

Simply change the bucket settings in the General Section, the local and remote
dir in the Sync Section, save with a new name and you’re done!

Heck, you can even use the same bucket if you want. In that case, don’t change
anything in the General Settings.Just make up a name for the remote directory
location to keep things organized,and voilà, you’re done!

Let’s say, for example, that you take screenshots on your phone, and you want
to sync those to a subdirectory of the bucket you created above.

No problem, that’s easy.Select your configuration at the main screen, and hit
“Copy.” The configuration screen opens.  Leave the General and Advanced tabs
alone and go straight to Sync.

15

Browse the Local Dir setting and navigate to the folder where your phone stores
screenshots.

Set the Remote Dir to a bucket subdirectory where you want your screenshots
stored (remember, it doesn’t have to exist yet – S3Anywhere will make it for
you).

And…that’s it.

16

Save the configuration with a new name.

Sync it.

And it’s done.

Done, I tell you!

But don’t take my word for it – verify in the panel that your files have been
uploaded…

17

and the subdirectory for your screenshots filled.

18

Happy syncing! :-)
