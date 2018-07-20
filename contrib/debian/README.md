
Debian
====================
This directory contains files used to package siriusd/sirius-qt
for Debian-based Linux systems. If you compile siriusd/sirius-qt yourself, there are some useful files here.

## sirius: URI support ##


sirius-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install sirius-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your sirius-qt binary to `/usr/bin`
and the `../../share/pixmaps/bitcoin128.png` to `/usr/share/pixmaps`

sirius-qt.protocol (KDE)

