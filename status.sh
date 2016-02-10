#!/bin/bash

#  chrome: f268
#  term: f120

workspaces() {
    current=$(xprop -root _NET_CURRENT_DESKTOP | cut -d' ' -f3)
    echo $(($current + 1))
}

window() {
    id=$(xprop -root _NET_ACTIVE_WINDOW | grep -o "0x.*")
    class=$(xprop -id $id WM_CLASS | cut -d' ' -f3 | tr -d ',' | tr -d '"')
    icon=""
    if [ "$class" == "urxvt" ]; then
        icon="\uf120"
    elif [ "$class" == "chromium" ]; then
        icon="\uf268"
    fi
    name=$(xprop -id $id WM_NAME | grep -o "\".*\"" | tr -d '"')

    echo "$icon    $name"
}

# not working
volume() {
    off="\uf026"
    low="\uf027"
    high="\uf028"
}

battery() {
    status="$(cat /sys/class/power_supply/BAT1/status)"
    perc=$(cat /sys/class/power_supply/BAT1/capacity)

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

    echo "${icon}%{F-}  ${perc}%"
}
    
network() {
    icon="\uf1eb"
    ssid=$(iw dev wlp3s0 link | head -2 | tail -1 | cut -d' ' -f2)
    ip=$(for i in $(ip r); do echo $i; done | grep -A 1 src | tail -1)
    echo "$icon  $ssid"
}

datetime() {
    icon_clk="\uf017"
    icon_cal="\uf073"

    date="$(date "+%a %D")"
    loc_time="$(date "+%l:%M %p")"

    echo "$icon_cal   $date      $icon_clk $loc_time   "
}

while true; do
    echo -e "%{l}    $(workspaces)              $(window)%{r}$(network)        $(battery)        $(datetime)"
done
