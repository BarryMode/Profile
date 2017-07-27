####################################################################
#                                                                  #
#  Quick defaults to get SSH and SFTP working with Remote Login    #
#  ------------------------------------------------------------    #
#  To use SSH or SFTP outside of your network, you'll have to      #
#  configure the NAT settings in your router to deal with your     #
#  port and route it to your network IP Address (ex. 192.168.1.2). #
#                                                                  #
####################################################################

sudo -v

################
# Remote Login #
################

# Enable remote login
systemsetup -setremotelogin on

#######
# SSH #
#######

# Create a new ssh group
dseditgroup -o create -q com.apple.access_ssh
# Set the new ssh group to admins only
dseditgroup -o edit -a admin -t group com.apple.access_ssh

# Presets for sshd_config
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication no/PasswordAuthentication no/g' /etc/ssh/sshd_config
sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/g' /etc/ssh/sshd_config
sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/g' /etc/ssh/sshd_config
# Restart ssh
launchctl unload -w /System/Library/LaunchDaemons/ssh.plist
launchctl load -w /System/Library/LaunchDaemons/ssh.plist

############
# Firewall #
############

# Enable firewall port 22
# sed -i '' -e '$a\pass in proto tcp from any to any port 22' /etc/pf.conf; pfctl -vnf /etc/pf.conf

# Restart firewall
# launchctl unload -w /System/Library/LaunchDaemons/com.apple.pfctl.plist
# launchctl load -w /System/Library/LaunchDaemons/com.apple.pfctl.plist