#!/bin/bash
sudo su
vgs
vgrename debian-vg OtusRoot
sed -i 's~/dev/mapper/debian--vg-root~/dev/mapper/OtusRoot--vg-root~g' /etc/fstab
sed -i 's~/dev/mapper/debian--vg-swap_1~/dev/mapper/OtusRoot--vg-swap_1~g' /etc/fstab
sed -i -e 's~/dev/mapper/debian~/dev/mapper/OtusRoot~g' /boot/grub/grub.cfg
sed -i 's~/dev/mapper/debian~/dev/mapper/OtusRoot~g' /etc/initramfs-tools/conf.d/resume
echo 'GRUB_DEVICE=/dev/mapper/OtusRoot-root' >> /etc/default/grub
sed -i 's~GRUB_DEVICE="`${grub_probe} --target=device /`"~GRUB_DEVICE="`${grub_probe} --target=device /`" || true~g' /usr/sbin/grub-mkconfig
update-initramfs -u -k all
update-grub
