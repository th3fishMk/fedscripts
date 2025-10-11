# 
# This commands assume that the distro being use is Fedora or fedora based
# Run `chmod u+x installs.sh`
# And then `sh installs.sh`

echo "Today is " `date`
echo "Installing all the things"

sudo dnf clean all
sudo dnf -y update


# All system install will be listed here
sudo dnf install gparted \
gnome-disks \
@c-development \

# Brave
curl -fsS https://dl.brave.com/install.sh | sh

# vscodium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h\n" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium

# vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code 

# Download and install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 22
node -v
npm -v

# Node stuff
npm install -g pnpm
npm install -g typescript

# Tauri dependencies
sudo dnf check-update
sudo dnf install webkit2gtk4.1-devel \
openssl-devel \
curl \
wget \
file \
libappindicator-gtk3-devel \
librsvg2-devel \
libxdo-devel

# flatpack
flatpak install flathub com.belmoussaoui.Authenticator
flatpak install flathub org.inkscape.Inkscape
flatpak install flathub org.onlyoffice.desktopeditors
flatpak install flathub com.spotify.Client
flatpak install flathub org.telegram.desktop
flatpak install flathub org.videolan.VLC


# Steam
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

sudo dnf install steam -y
