sudo su
apt install nfs-common nfs-kernel-server ufw -y
systemctl enable nfs-server
systemctl start ufw
systemctl enable ufw
ufw allow ssh
ufw allow nfs
ss -tuln
mkdir -p /srv/share
chmod 0777 /srv/share 
echo "/srv/share 192.168.56.11(rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports
systemctl restart nfs-server
exportfs -s
exportfs -r
exportfs
systemctl status rpcbind nfs-server
