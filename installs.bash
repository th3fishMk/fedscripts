# 
# This commands assume that the distro being use is Fedora or fedora based
# 

sudo dnf install @c-development 

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22

# Verify the Node.js version:
node -v # Should print "v22.19.0".

# Verify npm version:
npm -v # Should print "10.9.3".

npm install -g pnpm


# vscode

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code # or code-insiders


# Tauri

pnpm create tauri-app

# 
sudo dnf check-update
sudo dnf install webkit2gtk4.1-devel \
openssl-devel \
curl \
wget \
file \
libappindicator-gtk3-devel \
librsvg2-devel \
libxdo-devel
sudo dnf group install "c-development"