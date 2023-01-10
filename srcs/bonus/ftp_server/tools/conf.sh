#!/bin/bash
echo "listen=YES" >> /etc/vsftpd.conf
echo "listen_ipv6=NO" >> /etc/vsftpd.conf
echo "connect_from_port_20=YES" >> /etc/vsftpd.conf
echo "anonymous_enable=NO" >> /etc/vsftpd.conf
echo "local_enable=YES" >> /etc/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd.conf
echo "chroot_local_user=YES" >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "secure_chroot_dir=/var/run/vsftpd/empty" >> /etc/vsftpd.conf
echo "pam_service_name=vsftpd" >> /etc/vsftpd.conf
#  echo "pasv_enable=YES" >> /etc/vsftpd.conf
#  echo "pasv_min_port=40000" >> /etc/vsftpd.conf
#  echo "pasv_max_port=45000" >> /etc/vsftpd.conf
echo "userlist_enable=YES" >> /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
echo "userlist_deny=NO" >> /etc/vsftpd.conf
echo "local_root=/home/yismaili/html/wordpress" >> /etc/vsftpd.conf

useradd -m yismaili --uid=1000 && echo "yismaili:1234" | chpasswd
chmod -R 755 /home/yismaili/
chown -R yismaili:yismaili /home/yismaili
mkdir -p /var/run/vsftpd/empty/
echo "yismaili" | tee -a /etc/vsftpd/vsftpd.userlist

exec "$@"