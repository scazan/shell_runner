# SCRIPTS
a very simple interface for the norns to list and execute any shell script located in its "scripts" directory directly from the norns.

two scripts are included
* one to backup tape data to a cloud provider,
* another to backup my connected OP-Z (when OP-Z is in disk mode)

all data is copied to ~/dust/data/util_scripts/

for my own uses, I also enable the scripts to upload directly from the norns to cloud storage.
to enable this, install rclone onto your norns using these instructions: (https://rclone.org/install/)[https://rclone.org/install/]

setup a cloud drive and call it "drive" within rclone.

uncomment the last line in the two included scripts

