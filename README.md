# rpi-wpa2e-driver-workaround
A workaround to fix WPA2 Enterprise connections on Raspberry Pi

Connecting to WPA2 Enterprise at my university broke on Raspberry Pi recently and I had a number of these devices to fix, so this is a little script to automate patching them. This is an implementation of the fixes outlined [in a Raspian forum thread](https://www.raspberrypi.org/forums/viewtopic.php?p=1530590), the only information on the issue I could find. It's not too complicated of a fix, but I had trouble finding anything about it so hopefully this will help someone else.

Apparently the default nl80211 driver has a bug with WPA2E connections, so using the secondary wext driver will work in its place. This script backs up the current applicable config files and changes them to use the wext driver instead of nl80211.

## Install
To start, download the script and wpa_supplicant configuration file if you haven't set that up for WPA2E yet. Edit the SSID, username, and password in the wpa_supplicant to whatever your network needs. The included one is what works in my configuration, but you might have to tweak some things depending on your setup. Don't move it from whatever directory the script is in, just edit it and save. Invoke the script with `bash backup.sh` (using sh won't work because it doesn't support loops - I might take out the loop to make it easier to use though), reboot, and cross your fingers.
If something goes wrong, your original configuration files will be backed up where they were originally with a ".backup" suffix. I might make a script to revert the changes later, but for now just cd to wherever they are (/etc/ or /etc/wpa_supplicant/ for example) and `mv $FILENAME.backup $FILENAME`.
