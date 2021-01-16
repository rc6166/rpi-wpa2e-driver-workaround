#!/bin/bash

# Declare default wireless interface and file path variables
DEF_WLAN=wlan0
DEF_WPA_CONF=/etc/wpa_supplicant/wpa_supplicant.conf
DEF_FUNC_SH=/etc/wpa_supplicant/functions.sh
DEF_DHCPCD=/etc/dhcpcd.conf
DEF_HOOKS=/lib/dhcpcd/dhcpcd-hooks/10-wpa_supplicant
NEW_WPA_CONF=wpa_supplicant.conf

# Back up default config files
sudo cp $DEF_WPA_CONF $DEF_WPA_CONF.backup
sudo cp $DEF_FUNC_SH $DEF_FUNC_SH.backup
sudo cp $DEF_DHCPCD $DEF_DHCPCD.backup
sudo cp $DEF_HOOKS $DEF_HOOKS.backup
echo 'Default configurations backed up in default directories with ".backup" suffix'

# Copy new wpa configuration to default directory
sudo cp $NEW_WPA_CONF $DEF_WPA_CONF
echo 'New wpa configuration at ' $NEW_WPA_CONF ' copied to default directory'

# Replace all occurences of the default nl80211 driver with wext driver
# Todo: add backup suffix here to negate the backup block on line 12
sudo sed -i 's/nl80211/blah/g' $DEF_FUNC_SH
sudo sed -i 's/wext/nl80211/g' $DEF_FUNC_SH
sudo sed -i 's/blah/wext/g' $DEF_FUNC_SH
echo 'Set new default driver in ' $DEF_FUNC_SH
sudo sed -i 's/nl80211/blah/g' $DEF_HOOKS
sudo sed -i 's/wext/nl80211/g' $DEF_HOOKS
sudo sed -i 's/blah/wext/g' $DEF_HOOKS
echo 'Set new default driver in ' $DEF_HOOKS

# Append extra config to /etc/dhcpcd.conf
echo -e 'interface wlan0\nenv ifwireless=1\nenv wpa_supplicant_driver=wext,nl80211'>>/etc/dhcpcd.conf
echo 'Updated /etc/dhcpcd.conf'