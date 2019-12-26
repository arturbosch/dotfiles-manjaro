# My Arch Linux setup

## Installing Arch Linux

- https://linuxhint.com/setup-luks-encryption-on-arch-linux/
- https://www.youtube.com/watch?v=nSHOb8YU9Gw
- https://linuxhint.com/install-yaourt-arch-linux/
- https://github.com/maximbaz/dotfiles/blob/master/INSTALL\_ARCH.md

## systemd-boot

- nvim /boot/loader/loader.conf

```
default arch
```

- nvim /boot/loader/entries/arch.conf

```
title Arch Linux
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img
options cryptdevice=UUID=[UUID] root=/dev/mapper/luks_root rw acpi\_rev\_override=1
```

## Setup

- git clone https://github.com/arturbosch/dotfiles ~/.dotfiles
- chmod +x -R .dotfiles
- cd ~/.dotfiles
- ./mkdirs.sh
- ./links.sh
- ./software.sh
- ./system\_software.sh
- ./yaourt.sh
- ./software\_from\_yaourt.sh
- ./snap.sh
- betterlockscreen -u ~/Pictures/desktop.jpg

## Disable dicrete GPU

- sudo pacman -S bbswitch bumblebee
- add "acpi\_rev\_override=1" to the boot parameters
- systemctl enable bumblebee.service
- cat /proc/acpi/bbswitch // OFF

## Tlp & powertop

- sudo pacman -S tlp powertop
- systemctl enable tlp.service
- systemctl enable tlp-sleep.service
- sudo nvim /etc/systemd/system/powertop.service

```
[Unit]
Description=Powertop tunings

[Service]
Type=exec
ExecStart=/usr/bin/powertop --auto-tune
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
```

## nvim & coc

https://github.com/neoclide/coc.nvim

- :PlugInstall
- :UpdateRemotePlugins
- :CoCInstall coc-python coc-emmet coc-yaml coc-json coc-tsserver coc-html coc-css coc-eslint coc-prettier coc-java

## Firefox Theme

```
https://color.firefox.com/?theme=XQAAAAIZAQAAAAAAAABBqYhm849SCia2CaaEGccwS-xNKlhTF0Gdmgrt-MSYP_BJi3ulTyQ6uQYTNGDKin1K3CBj-xHrShb_hiDHwcWL6bwrs97I3hc_wBau8NR4r6ZYXDmW8eq7q4t79j10kcZlMWezi6GXdt8y9OGen60KntARoemPMyQckFa5kxtAVgBRpA17vAsX_bTmvGGx58V5eILytg07RqZqvngmtUo2vZKh50ZR4Dd0z7_5Aji2
```

## Printer Setup

```sh
sudo pacman -S cups gutenprint simple-scan
systemctl enable org.cups.cupsd.service
systemctl start org.cups.cupsd.service
http://localhost:631/admin
```

## Update XPS 15 Bios

- sudo mkdir /boot/EFI/Dell/Bios
- sudo mv ~/Downloads/XPS\_15...exe /boot/EFI/Dell/Bios
- Restart and Install Bios Update
