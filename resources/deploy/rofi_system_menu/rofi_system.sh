#! /bin/sh

set -euCo pipefail

declare -Ar menu=(
#  ['Lock']='i3lock && sleep 1'
  ['Logout']='i3-msg exit'
  ['Hibernate']='systemctl hibernate'
  ['Poweroff']='systemctl poweroff'
  ['Reboot']='systemctl reboot'
)

function print_keys() {
  local -r IFS=$'\n'
  echo "${!menu[*]}"
}

function main() {
  local -r yes='yes' no='no'

  if [[ $# -eq 0 ]]; then
    print_keys
  elif [[ $# -eq 1 ]]; then
    echo $1 ${no}
    echo $1 ${yes}
  elif [[ $2 == ${yes} ]]; then
    eval "${menu[$1]}"
  elif [[ $2 == ${no} ]]; then
    print_keys
  fi
}

main $@
