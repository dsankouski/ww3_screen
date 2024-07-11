#!/bin/bash

USAGE=$(cat << EOF
Usage: ./ww3_screen.sh <action [start|stop]> <game id>
EOF
)

action=$1
game_id=$2
if [ "$action" = 'start' ]; then 
  xdotool search --name "Conflict of Nations - World War 3 - Chromium" set_window --name "$game_id"
  cat <<- EOF > /etc/cron.d/ww3-"$game_id"
  */1 * * * * sh -c 'import -window "$game_id" ~/ww3/$game_id/screen-$(date +%y-%m-%d-%H:%M:%S).png'
EOF
elif [ "$action == 'stop' ]; then
  rm -rf /etc/cron.d/ww3-"$game_id"
else
  echo $USAGE
fi

