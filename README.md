# SCRIPTS
a very simple interface for the norns to list and execute any shell script located in its "scripts" directory directly from the norns.

if you have a script you want to be executable from the norns. throw it into ~/dust/code/norns_scripts/scripts/ and it should show in the list.

two scripts are included
* one to backup tape data to a cloud provider,
* another to backup my connected OP-Z (when OP-Z is in disk mode)

all the backup data from those scripts is copied to ~/dust/data/norns_scripts/
**note that files are moved from the tape directory to the ~/dust/data/norns_scripts/ directory**
**make sure to check that your data was uploaded or that you have downloaded your data from the norns BEFORE using the clear data script. that script REMOVES the backup (and the original) from the norns**

# upload to the cloud with rclone
for my own uses, I also enable the scripts to upload directly from the norns to cloud storage.
to enable this, install rclone onto your norns using these instructions: https://rclone.org/install/

setup a cloud drive and call it "drive" within rclone.

uncomment the last line in the two included scripts

this will backup your tape directory or your OP-Z and immediately upload it to Google Drive, Dropbox, Amazon S3, or any of the support cloud providers from rclone.


