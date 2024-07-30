#!/bin/bash

# List of packages to install
packages=(
	"hyprland-git"
	"hyprlock-git"
	"ttf-liberation"
	"swww"
	"waybar-cava"
	"cava"
	"playerctl"
	"mpd"
	"mpv-mpris"
	"spotify"
	"ttf-fira-code"
	"ttf-fira-mono"
	"ttf-roboto"
	"ttf-jetbrains-mono"
	"ttf-jetbrains-mono-nerd"
	"proggyfonts"
	"rofi-wayland"
	"ttf-font-awesome"
	"fastfetch"
	"kitty"
	"imagemagick"
	"polkit-gnome"
	"papirus-icon-theme"
	"catppuccin-cursors-mocha"
        "mako"
	"apparmor"
	"ufw"
)

# Install yay
install_yay() {
	echo "installing yay..."
	# Install the dependencies
	sudo pacman -S --needed --noconfirm base-devel git

	# Clone the yay repo and install
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm
	cd ..
	rm -rf yay
}

# Check if yay is installed
if ! command -v yay &> /dev/null; then
  install_yay
else
  echo "yay is already installed."
fi

# Make sure the system is up to date
echo "Making sure system is up to date..."
sudo pacman -Syu --noconfirm

# Actually install the packages
echo "Installing necessary packages"
for package in "${packages[@]}"; do
  if [ ! -z "$package" ]; then
   echo "Installing $package..."
   yay -S --noconfirm "$package"
  fi
done

echo "All packages installed successfully"
