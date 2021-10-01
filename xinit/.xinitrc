# Random wallpaper with feh (at the start of every session)
feh --bg-fill --randomize ~/.wallpapers/* &
# Compositor
picom -b --experimental-backends --backend glx --config ~/.config/picom.conf &

exec dbus-launch i3
