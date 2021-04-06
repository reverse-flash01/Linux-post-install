#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root!" 
   exit 1
fi
cat << "EOF"
__________               __    .__                 __         .__  .__          __  .__               
\______   \____  _______/  |_  |__| ____   _______/  |______  |  | |  | _____ _/  |_|__| ____   ____  
 |     ___/  _ \/  ___/\   __\ |  |/    \ /  ___/\   __\__  \ |  | |  | \__  \\   __\  |/  _ \ /    \ 
 |    |  (  <_> )___ \  |  |   |  |   |  \\___ \  |  |  / __ \|  |_|  |__/ __ \|  | |  (  <_> )   |  \
 |____|   \____/____  > |__|   |__|___|  /____  > |__| (____  /____/____(____  /__| |__|\____/|___|  /
                    \/                 \/     \/            \/               \/                    \/ 
EOF
sudo -u $SUDO_USER sleep 1
echo "Adding repositories........."
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
add-apt-repository 'deb https://typora.io/linux ./' -y 
echo "Updating the system.........."
apt update && apt upgrade -y
sudo -u $SUDO_USER sleep 1
echo "Installing new packages.........."
apt install code unp pulseeffects typora default-jre vnstat micro zram-config deja-dup unrar wget plank curl git neofetch nautilus-script-manager fish build-essential powertop htop tlp python3-pip gnome-tweaks tmux vlc plymouth-themes scrcpy -y
sudo -u $SUDO_USER flatpak install zoom jdowloader -y
echo "installing pip packages........"
sudo -u $SUDO_USER sleep 1
sudo -u $SUDO_USER pip3 install youtube-dl psutil
echo "Installation complete"
echo "Setting up powertop and tlp........"
powertop --auto-tune
tlp start
echo "changing the default shell....."
chsh -s /usr/bin/fish
echo "Setting up Swap area..."
sudo -u $SUDO_USER sleep 1
zramtcl
echo "Setting up the equalizer.........."
sudo -u $SUDO_USER wget  "https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh"
sudo -u $SUDO_USER echo 1 | ./install.sh
sudo -u $SUDO_USER sleep 1
echo "Removing the installation script........."
rm install.sh
echo "Setup Done........."
sudo -u $SUDO_USER sleep 1
echo "cleaning up......."
apt clean 
apt autoremove -y
echo "REBOOTING......"
reboot
