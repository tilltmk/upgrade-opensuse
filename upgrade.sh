#!/bin/bash

# System auf den neuesten Stand bringen
sudo zypper refresh
sudo zypper update

# Überprüfen, ob die Repositories bereits auf $releasever eingestellt sind
sudo sed -i 's/15.4/${releasever}/g' /etc/zypp/repos.d/*.repo

# Repositories auf die neue Version aktualisieren
sudo zypper --releasever=15.5 refresh

# Upgrade der Distribution durchführen
sudo zypper --releasever=15.5 dup --download-in-advance

# Nach dem Upgrade Neustart durchführen
echo "Upgrade abgeschlossen. System wird neu gestartet."
# sudo reboot
