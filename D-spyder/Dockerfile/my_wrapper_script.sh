#!/bin/bash
echo $uid
echo $gid
echo $PASSWORD
echo $username

groupadd -g $gid $gid

useradd $username -u $uid -g $gid

echo $username:$PASSWORD | chpasswd

mkdir -p /home/$username
mkdir -p /home/data-share
mkdir -p /home/lab

usermod --shell /bin/bash $username

# change user privilege
echo "$account ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo root:$PASSWORD | chpasswd

# Start the first process
#service ssh start
#/etc/init.d/ssh start

chmod 777 /home/data-share
chmod 777 /home/lab



# Start the first process
echo root:$password | chpasswd

# Start the second process
service ssh start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi

# Naive check runs checks once a minute to see if either of the processes exited.
# This illustrates part of the heavy lifting you need to do if you want to run
# more than one service in a container. The container exits with an error
# if it detects that either of the processes has exited.
# Otherwise it loops forever, waking up every 60 seconds

while sleep 60; do
  ps aux |grep ssh |grep -q -v grep
  PROCESS_2_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_2_STATUS -ne 0]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done
