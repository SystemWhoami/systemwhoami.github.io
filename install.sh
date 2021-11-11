sudo apt install python psmisc xserver-xorg-core x11-xserver-utils x11-utils imagemagick \
ffmpeg wireless-tools openbox pulseaudio alsa-utils brightnessctl nitrogen dunst tint2   \
lxpolkit rxvt-unicode xclip scrot mpd mpc thunar thunar-archive-plugin thunar-volman     \
ffmpegthumbnailer tumbler w3m w3m-img ncmpcpp viewnior mpv pavucontrol parcellite        \
gsimplecal neofetch htop xsettingsd xautolock rofi rsync
sudo apt install zsh && chsh -s $(command -v zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
sudo apt install meson ninja-build libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev        \
libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev    \
libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev \
libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev
git clone https://github.com/yshui/picom.git          && \
cd picom/ && git submodule update --init --recursive  && \
git checkout 9cb552ecd91ec644bf6fcb558ddd44fda5b4f7d9 && \
meson --buildtype=release . build                     && \
ninja -C build                                        && \
ninja -C build install
echo 'deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_Unstable/ /' | sudo tee /etc/apt/sources.list.d/home:Head_on_a_Stick:obmenu-generator.list
curl -fsSL https://download.opensuse.org/repositories/home:Head_on_a_Stick:obmenu-generator/Debian_Unstable/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_Head_on_a_Stick_obmenu-generator.gpg > /dev/null
sudo apt update
sudo apt install obmenu-generator git
git clone --depth 1 https://github.com/owl4ce/dotfiles.git
rsync -avxHAXP --exclude '.git*' --exclude 'LICENSE' --exclude '*.md' dotfiles/ ~/
pushd ~/.icons/ && \
    tar -xJf Papirus-Custom.tar.xz && tar -xJf Papirus-Dark-Custom.tar.xz && \
    sudo ln -vs ~/.icons/Papirus-Custom /usr/share/icons/
    sudo ln -vs ~/.icons/Papirus-Dark-Custom /usr/share/icons/
popd
fc-cache -rv
[ -n "$(pgrep mpd)" ] || mpd && mpc update
sudo chmod u+s $(command -v brightnessctl)
[ "$(readlink -f /bin/sh)" != "$(command -v bash)" ] && sudo ln -vfs $(command -v bash) /bin/sh
