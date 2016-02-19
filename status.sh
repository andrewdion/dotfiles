#!/bin/bash

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

    echo "%{F#ffffff}$icon%{F-}    $name"
}

pcname() {
    icon="\uf108"
    name=$(hostname)
    echo "%{F#ffffff}$icon%{F-}  $name"
}

network() {
    icon="\uf1eb"
    nic="wlp2s0"
    ssid=$(iw dev $nic link | head -2 | tail -1 | cut -d' ' -f2)
    ip=$(for i in $(ip r); do echo $i; done | grep -A 1 src | tail -1)
    echo "%{F#ffffff}$icon%{F-}  $ssid   %{F#666666}$ip%{F-}"
}

# not working
volume() {
    off="\uf026"
    low="\uf027"
    high="\uf028"
}
    
datetime() {
    icon_clk="\uf017"
    icon_cal="\uf073"

    date="$(date "+%a %D")"
    loc_time="$(date "+%l:%M %p")"

    echo "%{F#ffffff}$icon_cal%{F-}   $date      %{F#ffffff}$icon_clk%{F-} $loc_time   "
}

while true; do
    echo -e "%{l}    $(workspaces)        $(window)%{c}$(pcname)%{r}$(network)        $(datetime)"
    sleep 1
done
