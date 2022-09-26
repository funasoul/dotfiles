#!/bin/ksh

# trap 'exec $0' HUP # Restart itself
# trap 'tput cnorm; exit 1' INT QUIT TERM

_norm="\033[39m"
_alrt="\033[31m"
_warn="\033[33m"
_rset="\033[0m"
_hide="\033[2m"

format_mute="%{F#666}"
format_reset="%{F-}"

set -A _bat "" "" ""
set -A _pwr ""
set -A _net "" "直"
set -A _nic "em0" "iwx0"
set -A _vol "  " "  " "奔 " "墳 " "  "

function bat {
  [[ $(apm -a) -eq 1 ]] \
    && echo -n "${_pwr[0]} " \
    || echo -n "${_bat[$(apm -b)]} "
  echo -n "$(apm -l)%"
}

function cal {
  [[ $(date "+%H") -ge 6 && $(date "+%H") -le 22 ]] \
    && echo -n "${_norm}" \
    || echo -n "${_warn}"
  echo -n $(date '+%a %d %b %H:%M')${_norm}
}

function cpu {
  echo -n "龍$(sysctl -n hw.setperf)% "
  echo -n " $(sysctl -n hw.sensors.cpu0.temp0 | cut -d '.' -f 1)°C"
}

function filesystem {
  echo -n "$1: $(df -h $1 | tail -1 | awk '{print $5}')"
}

function grp {
  echo -n "${_hide}[ "
  echo -n "$(xprop -root 32c '\t$0' _NET_CURRENT_DESKTOP | cut -f 2)"
  echo -n " ]${_rset}"
}

function net {
  [[ -z "$(ifconfig ${_nic[0]} | grep 'status: no carrier')" ]] \
    && (echo -n ${_net[0]} ; return)
  echo -n $(ifconfig ${_nic[1]} | \
    awk '/ieee80211:/ { print "直    " $3 "(" $8 ")" }')
    return 0
}

function vol {
  _v=$(sndioctl -n output.level | awk '{ print int($0*100) }')
  [[ $(sndioctl -n input.mute) -eq 1 || $(sysctl kern.audio.record | cut -d'=' -f2) -eq 0 ]] \
    && echo -n "${format_mute}  ${format_reset}" \
    || echo -n "  "
  [[ $(sndioctl -n output.mute) -eq 1 ]] \
    && echo -n "${format_mute}婢  " \
    || echo -n "${_vol[$(($_v*5/101))]}"
  echo -n "$_v%"
}

function webcam {
  [[ $(sysctl kern.video.record | cut -d'=' -f2) -eq 0 ]] \
    && echo -n "${format_mute}  ${format_reset}" \
    || echo -n "  "
}

function win {
  _wid=$(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2)
  _win=$(xprop -id $_wid '\t$0' _NET_WM_NAME | awk -F '"' '{ print $2 }')
  echo -n " ${_win}"
}

$@
