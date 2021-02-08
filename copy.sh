#!/bin/sh

# Declare default file path variables
DEF_WPA_CONF=/etc/wpa_supplicant/wpa_supplicant.conf
DEF_FUNC_SH=/etc/wpa_supplicant/functions.sh
DEF_DHCPCD=/etc/dhcpcd.conf
DEF_HOOKS=/lib/dhcpcd/dhcpcd-hooks/10-wpa_supplicant
NEW_WPA_CONF=wpa_supplicant.conf
NEW_FUNC_SH=functions.sh
NEW_DHCPCD=dhcpcd.conf
NEW_HOOKS=10-wpa_supplicant

# Back up default config files
cp $DEF_WPA_CONF $DEF_WPA_CONF.backup
cp $DEF_FUNC_SH $DEF_FUNC_SH.backup
cp $DEF_DHCPCD $DEF_DHCPCD.backup
cp $DEF_HOOKS $DEF_HOOKS.backup
echo 'Default configurations backed up in default directories with ".backup" suffix'
echo
sleep 2

# Copy new wpa configuration to default directory
cp $NEW_WPA_CONF $DEF_WPA_CONF
echo 'New wpa configuration copied to default directory'
cp $NEW_FUNC_SH $DEF_FUNC_SH
echo 'New functions.sh copied to default directory'
cp $NEW_DHCPCD $DEF_DHCPCD
echo 'New dhcpcd.conf copied to default directory'
cp $NEW_HOOKS $DEF_HOOKS
echo 'New dhcpcd-hooks file copied to default directory'

sleep 2
echo 'Reboot to apply changes.'