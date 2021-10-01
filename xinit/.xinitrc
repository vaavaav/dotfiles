# Random wallpaper with feh (at the start of every session)
feh --bg-fill --randomize ~/.wallpapers/* &

# Compositor
picom -b --experimental-backends --backend glx --config ~/.config/picom.conf &

# Polybar
exec_always --no-startup-id $HOME/.config/polybar/launch.sh

exec dbus-launch i3
