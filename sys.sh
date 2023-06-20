#!/bin/bash

sudo su
  echo "# Configuration file for my watchlog service
      # Place it to /etc/sysconfig
      # File and word in that file that we will be monit
      WORD='ALERT'
      LOG=/var/log/watchlog.log
     " > /etc/watchlog
touch /opt/watchlog.sh && chmod +x /opt/watchlog.sh
  echo "#!/bin/bash
      WORD=ALERT
      LOG=/var/log/watchlog
      DATE=`date`
         if grep $WORD $LOG &> /dev/null
           then
            logger "$DATE: I found word, Master!"
           else
          exit 0
         fi
" > /opt/watchlog.sh
  echo '
[Unit]
  Description=My watchlog service
[Service]
  Type=oneshot
  EnvironmentFile=/etc/watchlog
  ExecStart=/bin/sh /opt/watchlog.sh $WORD $LOG
' > /etc/systemd/system/watchlog.service
   echo '[Unit]
  Description=Run watchlog script every 30 second
[Timer]
# Run every 30 second
  OnUnitActiveSec=30
  Unit=watchlog.service
[Install]
  WantedBy=multi-user.target' > /etc/systemd/system/watchlog.timer
systemctl daemon-reload
systemctl start watchlog.service
systemctl start watchlog.timer
systemctl status watchlog.timer
systemctl status watchlog.service
atp update
apt autoremove -y
apt upgrade -y
apt install spawn-fcgi php php-cli php-cgi apache2 -y
   echo 'Socket=/var/run/spawn-fcgi.socket
Options=-u www-data -g www-data -s $Socket -P /var/run/spawn-fcgi.pid -- /usr/bin/php-cgi'> /etc/systemd/spawn-fcgi
   echo '[Unit]
   Description=Spawn-fcgi socket
[Socket]
   ListenStream=/var/run/spawn-fcgi.socket
   SocketMode=9000
[Install]
   WantedBy=sockets.target' > /etc/systemd/system/spawn-fcgi.socket
echo '[Unit]
   Description=Spawn FastCGI Service
   After=spawn-fcgi.socket
[Service]
   PIDFile=/var/run/spawn-fcgi.pid
   Type=forking
   EnvironmentFile=/etc/systemd/spawn-fcgi
   ExecStart=/usr/bin/spawn-fcgi $Options
   KillMode=process
   Restart=on-failure
[Install]
   WantedBy=multi-user.target' > /etc/systemd/system/spawn-fcgi.service
   systemctl daemon-reload
   systemctl start spawn-fcgi.service
   systemctl enable spawn-fcgi.service
   systemctl status spawn-fcgi.service
   mkdir /var/www/V 
   mkdir /var/www/B
   echo"<VirtualHost *:8888>
ServerAdmin Vitalii@localhost
DocumentRoot /var/www/V
</VirtualHost>" > /etc/apache2/sites-enabled/000-default.conf
sed  -i 's~Listen 80~Listen 8888~g' /etc/apache2/ports.conf
mkdir /etc/apache2-9999
cp -r /etc/apache2/* /etc/apache2-9999
    echo'<VirtualHost *:9999>
ServerAdmin Best@localhost
DocumentRoot /var/www/B
</VirtualHost>' > /etc/apache2-9999/sites-enabled/000-default.conf
sed  -i 's~Listen 8888~Listen 9999~g' /etc/apache2-9999/ports.conf
mkdir /var/log/apache2-9999/
systemctl daemon-reload
systemctl restart apache2
systemctl start apache2@9999.service
systemctl status apache2.service
systemctl status apache2@9999.service
ss -tuln
