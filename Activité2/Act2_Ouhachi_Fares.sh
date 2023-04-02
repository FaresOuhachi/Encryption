#!/bin/bash

# Create an empty PUBKEYS file
touch /PUBKEYS

while read user; do

  echo "user $user created"

  useradd $user

  echo "$user:123456789" | chpasswd

  mkdir -p /home/$user/KEYS

  openssl genrsa -out /home/$user/KEYS/$user.key 1024
  
  openssl rsa -in /home/$user/KEYS/$user.key -pubout -out /home/$user/KEYS/$user.pub

  chmod 600 /home/$user/KEYS/$user.key
  chmod 644 /home/$user/KEYS/$user.pub 
  chown -R $user:$user /home/$line/KEYS
  echo $user >> /PUBKEYS
  echo -n $(cat /home/$user/KEYS/$user.pub) >> /PUBKEYS

done < $1

# Remove write permission from the PUBKEYS file
chmod -w /PUBKEYS

