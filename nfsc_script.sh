sudo su
apt install nfs-common ufw -y
systemctl start ufw
systemctl enable ufw
ufw allow ssh
ufw allow nfs
echo "192.168.56.10:/srv/share    /mnt    nfs    defaults    0 0" >> /etc/fstab
systemctl daemon-reload
systemctl restart remote-fs.target
cp -rv /var/log* /mnt
rm -rv /mnt
