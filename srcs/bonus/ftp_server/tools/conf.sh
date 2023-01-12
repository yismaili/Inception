#!/bin/bash

if [ ! -d /home/yismaili/ftp ]; then
# creates the user's home directory if it does not exist
    useradd -m yismaili && echo "yismaili:1234" | chpasswd
# creates any missing parent directories in the path
    mkdir -p /home/yismaili/ftp
    chown nobody:nogroup /home/yismaili/ftp
# removes write permissions for all users 
    chmod a-w /home/yismaili/ftp
# changes the ownership of this the directory and the group
    chown -R yismaili:yismaili /home/yismaili/ftp
# add the user in the file (list of users)
    echo "yismaili" | tee -a /etc/vsftpd.userlist
fi 
cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
#he vsftpd server to listen for incoming connections on all interfaces and the default port 21.
echo "listen=YES" >> /etc/vsftpd.conf
# the vsftpd server to not listen for incoming connections on IPV6 addresses the FTP server will only accept 
# connections made over IPV4 addresses and will not bind to any IPV6 addresses.
echo "listen_ipv6=NO" >> /etc/vsftpd.conf
# allow data connections to be made from port 20 , this  data connection is used to transfer files to and from the server during a file transfer
# and the client opens a new connection to the server from a random port
echo "connect_from_port_20=YES" >> /etc/vsftpd.conf
# not allow anonymous connect to the server, the server will only allow connections from users with a valid account on the system.
echo "anonymous_enable=NO" >> /etc/vsftpd.conf  
#the vsftpd will allow users with accounts on the system to connect and authenticate using their username and password.
echo "local_enable=YES" >> /etc/vsftpd.conf 
# users to upload files to the server and By default, vsftpd only allows users to download files
echo "write_enable=YES" >> /etc/vsftpd.conf 
#the local users will only have access to the files and directories within their home directory 
echo "chroot_local_user=YES" >> /etc/vsftpd.conf 
#specific range of ports needs to be opened for passive mode connections to work.
echo "pasv_min_port=40000" >> /etc/vsftpd.conf 
echo "pasv_max_port=45000" >> /etc/vsftpd.conf 
#llows to control who is able to login to the ftp server by means of a list of usernames.
echo "userlist_enable=YES" >> /etc/vsftpd.conf 
#the location of the user list file, as specified by "userlist_file" directive.
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf 
 #the token that will be replaced by the user's login name. This directive only applies when the local_root directive is used in the config file.
echo "user_sub_token=yismaili" >> /etc/vsftpd.conf 
#allowing only the listed users in the 'userlist_file' directive to login
echo "userlist_deny=NO" >> /etc/vsftpd.conf 
#set the local root directory for users when they first log in and This is useful 
#if you want to limit the user's access to specific parts of the file system or for security reasons
echo "local_root=/home/yismaili/ftp" >> /etc/vsftpd.conf 
exec "$@"

