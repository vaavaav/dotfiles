#!/bin/bash
PACKAGES="alsa-utils bluez-git cmake-format dkms font-manager ghcup-hs-bin lightdm lightdm-gtk-greeter linux-headers neovim nvim-packer-git pavucontrol polybar ttf-material-design-icons-webfont xorg-server xorg-xinit adobe-source-han-serif-cn-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fontsadobe-source-han-serif-tw-fonts alacritty arandr biber bitwarden brightnessctl cargo clang cmake discord elixir feh firefox flameshot fzf gcc ghc gnome-keyring haskell-ormolu i3-wm inter-font man-db mupdf neofetch neovim-web-devicons-git network-manager-applet noisetorch noto-fonts-emoji oh-my-bash-git openssh-askpass openvpn picom playerctl pulseaudio-bluetooth python-black python-isort stylua rofi rustup shfmt spotify stremio texlive-basic texlive-bibtexextra texlive-fontsextra texlive-fontsrecommended texlive-langportuguese texlive-latex texlive-latexextra texlive-latexrecommended texlive-luatex texlive-mathscience texlive-plaingeneric thunderbird tmux tmux-plugin-manager ttf-iosevka typst unzip vim visual-studio-code-bin wget xclip zotero"

# Check if yay is already installed
if ! command -v yay &>/dev/null; then
  echo "Yay could not be found, installing..."
  sudo pacman -Syu --needed base-devel git
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  rm -rf yay
  echo "Yay installation completed successfully."
fi

echo "Installing packages..."
yay -Syu --needed --color always $PACKAGES
echo "Packages installed successfully."

echo "Configuring the system..."
for config in "fontconfig gtk-3.0 i3 nvim polybar rofi alacritty.toml picom.conf tmux"; do
  cp -lrf $config ~/.config/
done
for config in ".xinitrc .bashrc"; do
  cp -lrf $config ~
done
source ~/.bashrc
for config in "pacman.conf lightdm"; do
  sudo cp -lrf $config /etc/
done

echo "Configuring git..."
git config set user.name "vaavaav"
git config set user.email "the.jprp@gmail.com"
git config set core.editor vim
git config set init.defaultBranch main

echo "Setting up GHC..."
ghcup install ghc recommended --set
ghcup install cabal recommended --set
ghcup install stack recommended --set
ghcup install hls recommended --set
cabal update
cabal new-configure --disable-library-vanilla --enable-shared --enable-executable-dynamic --ghc-options=-dynamic

echo "Finished setup."
