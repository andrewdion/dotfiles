#!/bin/bash

pad_with_gray() {
    which_type=$1
    num=$2
    gray="%{F#242424}"
    digits=${#num}
    case $which_type in
        vol)
            case $digits in
                1) vol="${gray}00%{F-}${num}";;
                2) vol="${gray}0%{F-}${num}";;
                3) vol=$num;;
            esac
            ;;
        level)
             case $digits in
                1) level="${gray}00%{F-}${num}";;
                2) level="${gray}0%{F-}${num}";;
                3) level=$num;;
            esac
            ;;
        perc)
            case $digits in
                1) perc="${gray}00%{F-}${num}";;
                2) perc="${gray}0%{F-}${num}";;
                3) perc=$num;;
            esac
            ;;
    esac
}

workspaces() {
    current=$(xprop -root _NET_CURRENT_DESKTOP | cut -d' ' -f3)
    echo $(($current + 1))
}

window() {
    id=$(xprop -root _NET_ACTIVE_WINDOW | grep -o "0x.*")
    class=$(xprop -id $id WM_CLASS | cut -d' ' -f3 | tr -d ',' | tr -d '"')
    icon=""
    case $class in
    urxvt)
        icon="\uf120"
        ;;
    google-chrome)
        icon="\uf268"
        ;;
    esac
    name=$(xprop -id $id WM_NAME | grep -o "\".*\"" | tr -d '"')

    echo "$icon    $name"
}

pcname() {
    icon="\uf109"
    name=$(hostname)
    echo "$icon  $name"
}

network() {
    icon="\uf1eb"
    nic="wlp1s0"
    ssid=$(iw dev $nic link | head -2 | tail -1 | cut -d: -f2 | sed 's/^[ \t]*//')
    ip=$(ip addr show wlp1s0 | head -3 | tail -1 | cut -d' ' -f6 | cut -d/ -f1)
    echo "$icon  $ssid  %{F#666666}$ip%{F-}"
}

volume() {
    icon="\uf028"
    muted=$(amixer -M get PCM | tail -1 | cut -d' ' -f9)
    vol=$(amixer -M get PCM | tail -1 | grep -o "[0-9]*%" | tr -d '%')
    pad_with_gray vol $vol
    if [ $muted == "[off]" ]; then
        icon="%{F#ff0000}${icon}%{F-}"
    fi

    echo "$icon ${vol}%"
}

backlight() {
    screen="intel_backlight"
    brightness=$(cat /sys/class/backlight/${screen}/brightness)
    # intel max = 937
    if [ $brightness -eq 937 ]; then
        level="100"
    elif [ $brightness -gt 843 ]; then
        level="90"
    elif [ $brightness -gt 750 ]; then
        level="80"
    elif [ $brightness -gt 656 ]; then
        level="70"
    elif [ $brightness -gt 562 ]; then
        level="60"
    elif [ $brightness -gt 468 ]; then
        level="50"
    elif [ $brightness -gt 374 ]; then
        level="40"
    elif [ $brightness -gt 280 ]; then
        level="30"
    elif [ $brightness -gt 186 ]; then
        level="20"
    elif [ $brightness -lt 94 ]; then
        level="10"
    fi
    pad_with_gray level $level

    echo "\uf185 ${level}%"
}

battery() {
    status="$(cat /sys/class/power_supply/BAT0/status)"
    perc=$(cat /sys/class/power_supply/BAT0/capacity)

    # set colors first
    icon=""
    if [ "$status" == "Charging" ]; then
        icon="%{F#00ff00}" # green
    else
        if [ $perc -lt 10 ]; then
            icon="%{F#ff0000}" # red
        elif [ $perc -lt 35 ]; then
            icon="%{F#ffff00}" # yellow
        fi
    fi

    # now set icons
    if [ $perc -lt 10 ]; then
        icon="${icon}\uf244" # empty
    elif [ $perc -lt 35 ]; then
        icon="${icon}\uf243" # 1/4 full
    elif [ $perc -lt 65 ]; then
        icon="${icon}\uf242" # 1/2 full
    elif [ $perc -lt 90 ]; then
        icon="${icon}\uf241" # 3/4 full
    else
        icon="${icon}\uf240" # full
    fi

    pad_with_gray perc $perc

    echo "${icon}%{F-} ${perc}%"
}
    
datetime() {
    icon_clk="\uf017"
    loc_time="$(date "+%l:%M %p")"

    echo "$icon_clk $loc_time   "
}

while true; do
#    echo -e "%{l}    $(workspaces)        $(window)%{c}$(pcname)%{r}$(network)        $(backlight)        $(volume)        $(battery)        $(datetime)"
    echo -e "%{l}    $(workspaces)%{c}$(pcname)%{r}$(network)        $(backlight)        $(volume)        $(battery)        $(datetime)"
    sleep 1
done
