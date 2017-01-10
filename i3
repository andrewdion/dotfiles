# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
font pango:DejaVu Sans Mono 8

set $up k
set $down j
set $left h
set $right l

# use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+t exec i3-sensible-terminal

# kill focused window
bindsym $mod+c kill

# dmenu
bindsym $mod+space exec dmenu_run -i -fn  "DejaVu Sans-10:bold" -l 1 -x 800 -y 420 -w 260

# lock screen
bindsym XF86Sleep exec /home/adion/dotfiles/screenlock.sh
bindsym $mod+Escape exec /home/adion/dotfiles/screenlock.sh

# change focus
bindsym $mod+$left focus left
bindsym $mod+$down focus down
bindsym $mod+$up focus up
bindsym $mod+$right focus right

# move focused window
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+Right split h

# split in vertical orientation
bindsym $mod+Down split v

# focus the parent container
bindsym $mod+Up focus parent

# focus the child container
bindsym $mod+Left focus child

# enter fullscreen mode for the focused container
bindsym $mod+m fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
#bindsym $mod+s layout stacking
#bindsym $mod+w layout tabbed
#bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+m floating toggle

# change focus between tiling / floating windows
bindsym $mod+Tab focus mode_toggle

# move the currently focused window to the scratchpad
#bindsym $mod+Shift+minus move scratchpad

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
#bindsym $mod+minus scratchpad show

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
#bindsym $mod+3 workspace 3
#bindsym $mod+4 workspace 4
#bindsym $mod+5 workspace 5
#bindsym $mod+6 workspace 6
#bindsym $mod+7 workspace 7
#bindsym $mod+8 workspace 8
#bindsym $mod+9 workspace 9
#bindsym $mod+0 workspace 10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
#bindsym $mod+Shift+3 move container to workspace 3
#bindsym $mod+Shift+4 move container to workspace 4
#bindsym $mod+Shift+5 move container to workspace 5
#bindsym $mod+Shift+6 move container to workspace 6
#bindsym $mod+Shift+7 move container to workspace 7
#bindsym $mod+Shift+8 move container to workspace 8
#bindsym $mod+Shift+9 move container to workspace 9
#bindsym $mod+Shift+0 move container to workspace 10

# reload the configuration file
#bindsym $mod+q reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+q restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+q exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"
#bindsym $mod+Shift+q exec i3-msg exit

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym Left        resize shrink width 5 px or 5 ppt

        bindsym Down        resize grow height 5 px or 5 ppt

        bindsym Up          resize shrink height 5 px or 5 ppt

        bindsym Right       resize grow width 5 px or 5 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
}

bindsym $mod+Return mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
#bar {
#        status_command i3status
#}

#######################################################################
# automatically start i3-config-wizard to offer the user to create a
# keysym-based config which used their favorite modifier (alt or windows)
#
# i3-config-wizard will not launch if there already is a config file
# in ~/.i3/config.
#
# Please remove the following exec line:
#######################################################################
#exec i3-config-wizard

# disable title bar
#new_window none
#new_window pixel 1
#new_float none

# disable edge borders
hide_edge_borders smart

# disable mouse focus
focus_follows_mouse no

##########
# COLORS #
##########

# fields:
#   border (just two thin lines around titlebar)
#   background
#   text
#   indicator (for indicating where a new window will be opened)
#   child_border (color around child window)

#set $dkgray     222222
set $dkgray     111111
set $ltgray     cccccc
set $black      000000
set $white      ffffff
set $red        ff0000
set $blue       3498db

# A client which currently has the focus.
client.focused #$black #$black #$black #$blue #$ltgray

# A client which is the focused one of its container, but it does not have \
# the focus at the moment.
client.focused_inactive #$black #$black #$black #$blue #$dkgray

# A client which is not the focused one of its container.
client.unfocused #$black #$black #$black #$blue #$dkgray

# A client which has its urgency hint activated.
#client.urgent #$black #$black #$black #$blue #$white

# Background and text color are used to draw placeholder window contents \
# (when restoring layouts). Border and indicator are ignored.
#client.placeholder #$black #$black #$black #$blue #$white

# Background color which will be used to paint the background of the client \
# window on top of which the client will be rendered. Only clients which do \
# not cover the whole area of this window expose the color. note that this \
# color class only takes a single color.
#client.background #$black

# i3-gaps stuff
for_window [class="^.*"] border pixel 0
for_window [class="URxvt"] border pixel 2
smart_gaps on
smart_borders on
gaps inner 20
gaps outer 0

# monitors
exec xrandr --output DVI-0 --auto --output DVI-1 --auto
