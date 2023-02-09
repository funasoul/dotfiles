export LANG=ja_JP.UTF-8
export XMODIFIERS=@im=ibus
# for Chrome, Firefox, etc.
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
# for Kitty
export GLFW_IM_MODULE=ibus
export LC_CTYPE=en_US.UTF-8

xset r rate 200 50
# feh --bg-fill ~/Pictures/Wallpapers/teal_puffy.png &
feh --bg-fill ~/Pictures/Kabe/2163086771_dd341c7f03_o.png &
picom --experimental-backends -b &

# Input Method
/usr/local/bin/ibus-daemon -d -x -r
tint2 &

# Window Manager
#exec i3
#exec /usr/local/bin/ck-launch-session /usr/local/bin/mate-session
exec bspwm
