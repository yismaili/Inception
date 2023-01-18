#!/bin/bash

# if [ ! -d /home/vlm/ftp ]; then
# creates the user's home directory if it does not exist
service vsftpd start;
adduser --gecos "" $ftp_usr
echo "$ftp_usr:$ftp_psswrd" | chpasswd
# changes the ownership of this the directory and the group
chown -R $ftp_usr:$ftp_usr /home/$ftp_usr/ftp
mkdir -p /home/vlm/ftp/
echo "$ftp_usr" | tee -a /etc/vsftpd.userlist
# fi 
# not allow anonymous connect to the server, the server will only allow connections from users with a valid account on the system.
echo "anonymous_enable=NO" >> /etc/vsftpd.conf  
#the vsftpd will allow users with accounts on the system to connect and authenticate using their username and password.
echo "local_enable=YES" >> /etc/vsftpd.conf 
# users to upload files to the server and By default, vsftpd only allows users to download files
echo "write_enable=YES" >> /etc/vsftpd.conf 
#the local users will only have access to the files and directories within their home directory 
echo "chroot_local_user=YES" >> /etc/vsftpd.conf 
#allowed to make changes to the directory
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf 
#specific range of ports needs to be opened for passive mode connections to work.
echo "pasv_min_port=40000" >> /etc/vsftpd.conf 
echo "pasv_max_port=40006" >> /etc/vsftpd.conf 
#allows to control who is able to login to the ftp server by means of a list of usernames.
echo "userlist_enable=YES" >> /etc/vsftpd.conf 
#the location of the user list file, as specified by "userlist_file" directive.
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf 
 #the token that will be replaced by the user's login name.
echo "user_sub_token=$ftp_usr" >> /etc/vsftpd.conf 
#allowing only the listed users in the 'userlist_file' directive to login
echo "userlist_deny=NO" >> /etc/vsftpd.conf 
#set the local root directory for users
echo "local_root=/home/vlm/ftp" >> /etc/vsftpd.conf
service vsftpd stop;
exec "$@"
