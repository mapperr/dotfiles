#! /bin/bash

get_datetime() {
    date '+%Y-%m-%d %H:%M'
}

get_wired_interfaces() {
    ip link | grep "[0-9]\{1,\}: en" | cut -d ' ' -f 2 | tr -d ':'
}

get_wireless_interfaces() {
    ip link | grep "[0-9]\{1,\}: wl" | cut -d ' ' -f 2 | tr -d ':'
}

get_network_interface_ip() {
    local interface_name="$1"
    test -z "$interface_name" && return
    ip a show $interface_name | grep "inet " | awk '{print $2}' | grep -o "[0-9\.]*"| head -n1
}

get_wireless_interface_link_info() {
    local interface_name="$1"
    test -z "$interface_name" && return
    local ssid=`iw dev $interface_name link | grep SSID | awk '{print $2}'`
    local signal=`iw dev $interface_name link | grep signal | awk '{print $2}'`
    echo -n "$signal:$ssid"
}

get_unread_mail_count() {
    hash notmuch || return
    notmuch search tag:unread | wc -l
}

get_cpu_percent_usage() {
    top -b -n1 -p 1 | rg -i cpu | head -n1 | sed 's#/# #' | sed 's/\./ /' | awk '{print $2}'
}

get_ram_percent_usage() {
    free -t | grep Mem | awk '{printf("%.0f"), $3/$2*100}'
}

get_swap_percent_usage() {
    free -t | grep Swap | awk '{printf("%.0f"), $3/$2*100}'
}

get_available_disk_space() {
    df -h | rg '/$' | awk '{print $4}'
}

get_battery_status() {
    local status=`cat /sys/class/power_supply/BAT0/status`
    if [ "$status" = "Full" ]; then
        echo -n "✓"
    elif [ "$status" = "Discharging" ]; then
        echo -n "↓"
    elif [ "$status" = "Charging" ]; then
        echo -n "↑"
    else
        echo -n "$status"
    fi
}

get_battery_percent_charge() {
    cat /sys/class/power_supply/BAT0/capacity
}

# ========

print_datetime() {
    local datetime=`get_datetime`
    echo -n "["
    echo -n "$datetime"
    echo -n "] "
}

print_resource_utilization() {
    local cpu_utilization=`get_cpu_percent_usage`
    local ram_utilization=`get_ram_percent_usage`
    local disk_available=`get_available_disk_space`
    local battery_status=`get_battery_status`
    local battery_level=`get_battery_percent_charge`
    echo -n "[sys"
    echo -n " $cpu_utilization%"
    echo -n " $ram_utilization%"
    echo -n " $disk_available"
    echo -n " $battery_status$battery_level%"
    echo -n "] "
}

print_network_info() {
    local wired_ints=`get_wired_interfaces`
    local wireless_ints=`get_wireless_interfaces`
    local network_ints="$wired_ints $wireless_ints"
    test "$network_ints" = " " && return

    echo -n "[net"
    for network_int in $network_ints; do
        ip=`get_network_interface_ip $network_int`
        local wl_info=":`get_wireless_interface_link_info $network_int`"
        test "$wl_info" = "::" && local wl_info=""
        echo -n " $network_int:$ip$wl_info"
    done
    echo -n "] "
}

print_new_mail() {
    local unread_mail_count=`get_unread_mail_count`
    echo -n "[mail"
    echo -n " $unread_mail_count"
    echo -n "] "
}

# =======

newmail=`print_new_mail`
netinfo=`print_network_info`
resources=`print_resource_utilization`
datetime=`print_datetime`

echo -n "$newmail $netinfo $resources $datetime"

