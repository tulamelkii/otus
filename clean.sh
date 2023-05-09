#!/bin/bash

DEBIAN_FRONTEND=noninteractive apt update -y
DEBIAN_FRONTEND=noninteractive apt clean all


# Добавление ssh-ключа для пользователя vagrant
sudo mkdir -pm 700 /home/vagrant/.ssh
sudo curl -sL https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o /home/vagrant/.ssh/authorized_keys
sudo chmod 0600 /home/vagrant/.ssh/authorized_keys
sudo chown -R vagrant:vagrant /home/vagrant/.ssh


# Удаление временных файлов
rm -rf /tmp/*
sudo rm  -f /var/log/auth*
sudo rm  -f /var/log/boot*
sudo rm  -f /var/log/btmp*
sudo rm  -f /var/log/kern*
sudo rm  -f /var/log/sys*

rm -rf /var/cache/* /usr/share/doc/*
sudo rm -rf /var/cache/apt
rm -rf /vagrant/home/*.iso
rm  -f ~/.bash_history
history -c

rm -rf /run/log/journal/*

