# rpi-wpa2e-driver-workaround

Connecting to WPA2 Enterprise at my university broke on Raspberry Pi recently and I had a number of these devices to fix, so this is a little script to automate patching them. This is an implementation of the fixes outlined [in a Raspian forum thread](https://www.raspberrypi.org/forums/viewtopic.php?p=1530590), the only information on the issue I could find. It's not too complicated of a fix, but I had trouble finding anything about it so hopefully this will help someone else.

Apparently the default nl80211 driver has a bug with WPA2E connections, so using the secondary wext driver will work in its place. This script backs up the current applicable config files and changes them to use the wext driver instead of nl80211.

## Install
To start, download the script and wpa_supplicant configuration file if you haven't set that up for WPA2E yet. Move to whichever directory you downloaded it to and edit the SSID, username, and password in the wpa_supplicant to whatever your network needs. The included one is what works in my configuration, but you might have to tweak some things depending on your setup. Don't move it from whatever directory the script is in, just edit it and save. Use the root user to invoke the script with `sudo sh copy.sh` and reboot.

If something goes wrong, your original configuration files will be backed up where they were originally with a ".backup" suffix. To revert the changes, cd to wherever the files are (/etc/ or /etc/wpa_supplicant/ for example) and `mv $FILENAME.backup $FILENAME`.
