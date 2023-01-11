#!/bin/bash
service  vsftpd start
useradd -m yismaili --uid=1000 && echo "yismaili:1234" | chpasswd
mkdir -p /home/yismaili/ftp
chown nobody:nogroup /home/yismaili/ftp
chmod a-w /home/yismaili/ftp
mkdir /home/yismaili/ftp/files
chown yismaili:yismaili /home/yismaili/ftp/files
cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
echo "listen=YES" >> /etc/vsftpd.conf
echo "listen_ipv6=NO" >> /etc/vsftpd.conf
echo "connect_from_port_20=YES" >> /etc/vsftpd.conf
echo "anonymous_enable=NO" >> /etc/vsftpd.conf  
echo "local_enable=YES" >> /etc/vsftpd.conf 
echo "write_enable=YES" >> /etc/vsftpd.conf 
echo "chroot_local_user=YES" >> /etc/vsftpd.conf 
echo "pasv_min_port=40000" >> /etc/vsftpd.conf 
echo "pasv_max_port=45000" >> /etc/vsftpd.conf 
echo "userlist_enable=YES" >> /etc/vsftpd.conf 
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf 
echo "user_sub_token=yismaili" >> /etc/vsftpd.conf 
echo "userlist_deny=NO" >> /etc/vsftpd.conf 
echo "local_root=/home/yismaili/ftp" >> /etc/vsftpd.conf 
echo "yismaili" | tee -a /etc/vsftpd.userlist 
killall -9 vsftpd
exec "$@"
