sudo pacman -S pulseaudio pulseaudio-alsa xorg xorg-server xorg-xinit
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -r yay
sudo pacman -S amd-ucode lm_sensors mesa lib32-mesa xf86-video-amdgpu vulkan-radeon amdvlk lib32-vulkan-radeon lib32-amdvlk libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau radeontop
yay -S wd719x-firmware aic94xx-firmware upd72020x-fw
sudo rm /boot/refind_linux.conf
sudo refind-install
sudo pacman -S lightdm lightdm-webkit2-greeter
yay -Syu lightdm-webkit2-theme-glorious
sudo sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf
sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = glorious #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo sed -i 's/^debug_mode\s*=\s*\(.*\)/debug_mode = true #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo pacman -S zsh &&
chsh -s $(command -v zsh) &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
sudo pacman -S openbox slim rofi tint2 termite dunst thunar mpd ncmpcpp geany neovim
yay -S rsync python psmisc xorg-xprop xorg-xwininfo imagemagick ffmpeg wireless_tools openbox \
pulseaudio pulseaudio-alsa alsa-utils brightnessctl nitrogen dunst tint2 gsimplecal rofi \
qt5-styleplugins lxsession xautolock rxvt-unicode-truecolor-wide-glyphs xclip scrot thunar \
thunar-archive-plugin thunar-volman ffmpegthumbnailer tumbler viewnior mpv mpd mpc ncmpcpp \
pavucontrol parcellite neofetch w3m htop picom-git obmenu-generator gtk2-perl playerctl xsettingsd
sudo pacman -S alsa-utils pavucontrol brightnessctl nitrogen xfce4-power-manager xautolock xclip parcellite gsimplecal polkit-gnome lxappearance scrot file-roller viewnior playerctl mpv zathura gimp mpd mpc ncmpcpp htop neofetch w3m iproute2 wireless_tools bash sed coreutils psmisc xorg-xprop xorg-xwininfo ffmpeg imagemagick python
yay -Syu slimlock networkmanager-dmenu-git qt5-styleplugins spotify xsettingsd 
cd ~/Documents/ && git clone https://github.com/owl4ce/dotfiles.git
rsync -avxHAXP --exclude '.git*' --exclude 'LICENSE' --exclude '*.md' dotfiles/ ~/
pushd ~/.icons/ &&
    tar -Jxvf Papirus-Custom.tar.xz && tar -Jxvf Papirus-Dark-Custom.tar.xz &&
    sudo ln -vs ~/.icons/Papirus-Custom /usr/share/icons/Papirus-Custom &&
    sudo ln -vs ~/.icons/Papirus-Dark-Custom /usr/share/icons/Papirus-Dark-Custom &&
popd
fc-cache -rv
sudo chmod u+s $(command -v brightnessctl)
[ "$(readlink /bin/sh)" != "bash" ] && sudo ln -vfs bash /bin/sh
echo "exec openbox-session" > ~/.xinitrc
sudo systemctl enable slim
sudo pacman -S firefox firefox-i18n-pt-br firefox-i18n-br firefox-adblock-plus firefox-clearurls firefox-dark-reader firefox-decentraleyes
echo "instalação finalizada!"
