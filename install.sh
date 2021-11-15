sudo pacman -S pulseaudio pulseaudio-alsa xorg xorg-server xorg-xinit
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -r yay
sudo pacman -S amd-ucode lm_sensors mesa lib32-mesa xf86-video-amdgpu vulkan-radeon amdvlk lib32-vulkan-radeon lib32-amdvlk libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau radeontop
yay -S wd719x-firmware aic94xx-firmware upd72020x-fw
yay -S python psmisc xorg-server xorg-xrandr xorg-xprop xorg-xwininfo imagemagick \
ffmpeg wireless_tools openbox pulseaudio pulseaudio-alsa alsa-utils brightnessctl  \
nitrogen dunst tint2 lxsession rxvt-unicode-truecolor-wide-glyphs xclip scrot mpd  \
mpc thunar thunar-archive-plugin thunar-volman ffmpegthumbnailer tumbler w3m       \
ncmpcpp viewnior mpv pavucontrol parcellite gsimplecal neofetch htop xsettingsd    \
xautolock obmenu-generator perl-gtk3 picom-git rofi rsync
yay -S alsa-utils pavucontrol brightnessctl nitrogen xfce4-power-manager xautolock parcellite xclip gsimplecal networkmanager-dmenu-git	qt5-styleplugins lxappearance xsettingsd scrot file-roller viewnior zathura mpd mpc ncmpcpp htop neofetch w3m iproute2 wireless_tools bc bash coreutils ffmpeg findutils grep imagemagick procps-ng psmisc python sed xorg-xprop xorg-xwininfo
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
