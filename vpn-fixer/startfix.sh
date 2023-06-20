#!/bin/bash
# =====================================
# title             : vpn fixer.sh
# description       : delete bugged connections of ProtoVPN after unsafe poweroff
# author            : Carlos Hernandez Navarro
# date              : 20/06/2023
# version	    : 0.8 (tested on ubuntu 20.04)
# =====================================


# Vars
protodesk="/usr/share/applications/protonvpn.desktop"
fixerdir="/usr/share/vpn-fixer/"
fixer="./modules/vpnfixscheduler.sh"
fscheduler="./modules/pvpn-fixer.sh"
replace_cont="[Desktop Entry]
Name=Proton VPN
Exec=/usr/share/vpn-fixer/vpnfixscheduler.sh
Terminal=false
Type=Application
Icon=protonvpn-logo
StartupWMClass=Protonvpn
Comment=Proton VPN GUI client
Categories=Network;
Keywords=vpn;"

# Create and move all the dependencies
mkdir -p $fixerdir
chmod +x $fixer
chmod +x $fscheduler
cp $fixer $fixerdir
cp $fscheduler $fixerdir

# Test if file exists
if [ -f "$protodesk" ]; then
	# Replace content from file
	echo "$replace_cont" > "$protodesk"
else
	echo "The $protodesk file does not exist. Is ProtonVPN installed?"
fi

echo "The fixer it was installed correctly"

# create alias for manually fix
alias vpnfix='/usr/share/vpn-fixer/pvpn-fixer.sh'
