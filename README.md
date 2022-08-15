# Where to store each configuration file?

Note for self: use soft (symbolic) links on the configuration files.

Edit: 15/08/2022

## Alacritty

According to https://github.com/alacritty/alacritty :

1. `$XDG_CONFIG_HOME/alacritty/alacritty.yml`
2. `$XDG_CONFIG_HOME/alacritty.yml`
3. `$HOME/.config/alacritty/alacritty.yml`
4. `$HOME/.alacritty.yml`

## Picom

According to https://wiki.archlinux.org/title/Picom :

1. `~/.config/picom/picom.conf`
2. `~/.config/picom.conf`

## Rofi

According to https://github.com/davatorium/rofi :

`~/.config/rofi/config.rasi`

## Vim

According to https://wiki.archlinux.org/title/vim :

- User-specific configuration: `~/.vimrc`
- Global configuration: `/etc/vimrc`

## Xinit

According to https://wiki.archlinux.org/title/xinit :

`~/.xinitrc`

## XMobar

According to https://codeberg.org/xmobar/xmobar :

1. `$XDG_CONFIG_HOME/xmobar/xmobarrc`
2. `~/.xmobarrc`

## XMonad

According to https://xmonad.org/TUTORIAL.html :

1. `$XDG_CONFIG_HOME/xmonad/xmonad.hs`
2. `~/.xmonad/xmonad.hs`
3. `$XMONAD_CONFIG_DIR/xmonad.hs`

