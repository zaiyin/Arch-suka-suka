#!/bin/bash

echo "===== Update Sistem ====="
sudo pacman -Syu --noconfirm

echo "===== Install AUR ====="
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "===== Install Driver NVIDIA ====="
sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings nvidia-prime

echo "===== Install XFCE Desktop ====="
sudo pacman -S --noconfirm \
    xfce4 \
    xfce4-goodies \
    gvfs \
    thunar-archive-plugin \
    xfce4-pulseaudio-plugin \
    xfce4-notifyd

echo "===== Install Wayland + Wayfire ====="
sudo pacman -S --noconfirm wayfire wf-config xwayland waybar
yay -S --noconfirm wayfire-plugins-extra wf-shell wcm

echo "===== Install Openbox ====="
sudo pacman -S --noconfirm openbox obconf obmenu-generator tint2 nitrogen lxappearance

echo "===== Install i3-gaps ====="
sudo pacman -S --noconfirm \
    i3-gaps \
    i3status \
    i3lock \
    dmenu \
    rofi

echo "===== Install BSPWM + SXHKD ====="
sudo pacman -S --noconfirm \
    bspwm \
    sxhkd

# Generate default configs
mkdir -p ~/.config/bspwm ~/.config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/ 2>/dev/null
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/ 2>/dev/null
chmod +x ~/.config/bspwm/bspwmrc

echo "===== Install Qtile ====="
sudo pacman -S --noconfirm \
    qtile \
    python-psutil \
    python-xcffib \
    python-cairocffi

echo "===== Install LabWC (Wayland Openbox-like) ====="
sudo pacman -S --noconfirm \
    labwc \
    foot \
    bemenu \
    swaybg \
    swayidle \
    swaylock

echo "===== Install Tools Umum ====="
sudo pacman -S --noconfirm \
    network-manager-applet \
    pavucontrol \
    lightdm \
    lightdm-gtk-greeter \
    lightdm-gtk-greeter-settings \
    alacritty 

echo "===== Enable Services ====="
sudo systemctl enable lightdm
sudo systemctl enable NetworkManager

echo "===== Instalasi Selesai! ====="
echo "Silakan reboot: sudo reboot"
