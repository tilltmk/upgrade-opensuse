#!/bin/bash

# Sicherstellen, dass das System vollständig aktualisiert ist
sudo zypper refresh
sudo zypper update

# Wechseln zu einem virtuellen Terminal (außerhalb von X-Window, um Abstürze zu vermeiden)
echo "Bitte wechseln Sie zu einem virtuellen Terminal (z.B. mit Ctrl+Alt+F3) und führen Sie das Skript erneut aus."
read -p "Drücken Sie Enter, um fortzufahren..."

# Überprüfen und Aktivieren der notwendigen Repositories
sudo zypper repos -u

# Repositories für Leap 15.5 hinzufügen und aktivieren
sudo zypper modifyrepo --all --disable
sudo zypper addrepo --check --refresh http://download.opensuse.org/distribution/leap/15.5/repo/oss/ repo-oss
sudo zypper addrepo --check --refresh http://download.opensuse.org/distribution/leap/15.5/repo/non-oss/ repo-non-oss
sudo zypper addrepo --check --refresh http://download.opensuse.org/update/leap/15.5/oss/ repo-update

# Repositories aktualisieren
sudo zypper refresh

# System-Upgrade durchführen
sudo zypper --releasever=15.5 dup --download-in-advance

# Nach dem Upgrade neustarten
echo "Upgrade abgeschlossen. Das System wird jetzt neu gestartet."
sudo reboot
