#!/bin/sh

flatpak-builder --force-clean build-dir --repo repo com.synology.drive.yml 
flatpak build-bundle repo synology-drive.flatpak com.synology.drive

echo sudo flatpak install synology-drive.flatpak
echo flatpak run com.synology.drive