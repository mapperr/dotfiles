sshd
echo "connect with: ssh `whoami`@`wwctl lan ip` -p 8022"
echo "press enter to stop"
read c
killall sshd
