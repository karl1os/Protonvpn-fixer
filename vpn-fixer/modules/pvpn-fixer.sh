#! /bin/bash

# Vars
crontodel="@reboot /usr/share/vpn-fixer/pvpn-fixer.sh"

nmcli connection show | awk '{ print $1 }' | grep pvpn | xargs nmcli connection delete;
nmcli connection show | awk -F '  ' '{print $1}' | grep proton | xargs nmcli connection delete;
nmcli connection show | awk -F '  ' '{print $1}' | grep -i Proton | sed 's/\(\S\+\) /\1\\ /g' | xargs nmcli connection delete;

newcron=$(crontab -l | grep -vF "$crontodel")
echo "$newcron" | crontab -
