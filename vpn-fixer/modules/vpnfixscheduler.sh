#!/bin/bash

# Var
cronvpnfixer="@reboot /usr/share/vpn-fixer/pvpn-fixer.sh"

# Cron task tester
	if ! crontab -l | grep -qF "$cronvpnfixer"; then
  	# Add the task to cron and execute ProtonVPN
		echo $cronvpnfixer | crontab -
		protonvpn
	else
	# Execute ProtonVPN
		protonvpn
	fi
