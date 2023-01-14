#!/bin/bash

# if [ ! -d /home/$ft_usr/ftp ]; then
# creates the user's home directory if it does not exist
service vsftpd start;
adduser --gecos "" $ft_usr
echo "$ft_usr:$ft_pass" | chpasswd
# creates any missing parent directories in the path
mkdir -p /home/$ft_usr/ftp/
# changes the ownership of this the directory and the group
chown -R $ft_usr:$ft_usr /home/$ft_usr/ftp
mkdir -p /home/vlm/ftp/
mkdir -p /var/run/vsftpd/empty
chmod -R 755 /var/run/vsftpd/empty
# fi 
# not allow anonymous connect to the server, the server will only allow connections from users with a valid account on the system.
echo "anonymous_enable=NO" >> /etc/vsftpd.conf  
#the vsftpd will allow users with accounts on the system to connect and authenticate using their username and password.
echo "local_enable=YES" >> /etc/vsftpd.conf 
# users to upload files to the server and By default, vsftpd only allows users to download files
echo "write_enable=YES" >> /etc/vsftpd.conf 
#the local users will only have access to the files and directories within their home directory 
echo "chroot_local_user=YES" >> /etc/vsftpd.conf 
#specific range of ports needs to be opened for passive mode connections to work.
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf 
echo "pasv_min_port=40000" >> /etc/vsftpd.conf 
echo "pasv_max_port=40006" >> /etc/vsftpd.conf 
#llows to control who is able to login to the ftp server by means of a list of usernames.
echo "userlist_enable=YES" >> /etc/vsftpd.conf 
#the location of the user list file, as specified by "userlist_file" directive.
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf 
 #the token that will be replaced by the user's login name. This directive only applies when the local_root directive is used in the config file.
echo "user_sub_token=$ft_usr" >> /etc/vsftpd.conf 
#allowing only the listed users in the 'userlist_file' directive to login
echo "userlist_deny=NO" >> /etc/vsftpd.conf 
#set the local root directory for users when they first log in and This is useful 
#if you want to limit the user's access to specific parts of the file system or for security reasons
echo "local_root=/home/vlm/ftp" >> /etc/vsftpd.conf
# add the user in the file (list of users)
echo "$ft_usr" | tee -a /etc/vsftpd.userlist
service vsftpd stop;
exec "$@"
