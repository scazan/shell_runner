# SHELL RUNNER (for norns)
a simple interface for the norns to list and execute any shell script located in its "scripts" directory directly from the norns.
shell scripts can be for bash, python 2.7, lua, or anything else that is stock on the norns.

if you have a script you want to be executable from the norns, throw it into ~/dust/code/shell_runner/scripts/ and it should show in the list.

if you have nice shell script you think others will find useful, feel free to submit a PR.
three scripts are included by default
* backup tape data (with option to upload to the cloud)
* backup a connected OP-Z (when OP-Z is in disk mode)
* clear all of shell runner's data (hopefully after you have grabbed the data off of the norns)

all the backup data from those scripts is copied to ~/dust/data/shell_runner/

**note that files are moved from the tape directory to the ~/dust/data/shell_runner/ directory**

**make sure to check that your data was uploaded or that you have downloaded your data from the norns BEFORE using the clear data script. that script REMOVES the backup (and the original) from the norns**


# automatically uploading to the cloud with rclone
for my own uses, I also enable the scripts to upload directly from the norns to cloud storage.
to enable this, install rclone onto your norns using these instructions: https://rclone.org/install/

setup a cloud drive and call it "drive" within rclone.

uncomment the last line in the two included scripts.

this will backup your tape directory and/or your OP-Z and immediately upload it to Google Drive, Dropbox, Amazon S3, or any of the support cloud providers from rclone.


