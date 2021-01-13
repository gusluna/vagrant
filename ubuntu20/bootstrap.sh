#!/bin/bash

# Enable ssh password authentication
echo "Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/.*PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Set Root password
echo "Set root password"
echo -e "12qwaszx" | passwd root >/dev/null 2>&1

# Set local user account
echo "Set up local user account"
useradd -m -s /bin/bash lunag
echo -e "12qwaszx" | passwd lunag >/dev/null 2>&1
echo "lunag ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo usermod -aG vagrant lunag

# Update bashrc file
echo "export TERM=xterm" >> /etc/bashrc
