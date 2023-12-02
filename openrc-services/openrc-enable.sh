#!/bin/bash
#
# After installing openrc and openrc-services, one is booted to a command line
# with only minimum of services enabled.
#
# Some common services that could be enabled:
# Note: Services are installed to /etc/openrc/init.d

rc-update add dbus default
rc-update add sysklogd default
rc-update add dcron default
rc-update add alsasound boot
rc-update add elogind default
rc-update add udev default
rc-update add devfs default
rc-update add hwclock default
rc-update add NetworkManager default
#rc-update add dmeventd default
#rc-update add lvmetad default
#rc-update add display-manager default

# Enabled services for current runlevel can be queried with:
rc-status
# Enabled services across all runlevels can be queried with:
rc-update

echo "
FILE /etc/default/grub

#GRUB_CMDLINE_LINUX_DEFAULT=""
GRUB_CMDLINE_LINUX_DEFAULT="init=/sbin/openrc-init" 
" > 
