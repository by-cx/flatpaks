all: build

build: build-synology-drive 
	flatpak build-sign repo --gpg-sign=462AFE612426B2E0CD25BFA9018304FFA8988F8D

.PHONY: build-synology-drive
build-synology-drive: pull
	flatpak-builder --force-clean build-dir --gpg-sign 462AFE612426B2E0CD25BFA9018304FFA8988F8D --repo repo synology-drive/com.synology.drive.yml

pull:
	mkdir -p repo/
	minioc mirror --overwrite doams/cx-flatpaks/ repo/

publish: build
	minioc mirror --overwrite repo/ doams/cx-flatpaks/
	minioc cp repo.flatpakrepo doams/cx-flatpaks/
