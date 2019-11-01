sshd
echo "connect with: ssh `whoami`@`bash $HOME/bin-utilities/get-my-ip.sh` -p 8022"
echo "press enter to stop"
read c
killall sshd
