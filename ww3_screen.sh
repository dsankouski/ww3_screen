#!/bin/bash

USAGE=$(cat << EOF
Usage: ./ww3_screen.sh <action [start|stop]> <game id>

Before this command invocation, open the game and make
sure it's window is active.
EOF
)

action=$1
game_id=$2
window_id=$(xdotool getactivewindow)
if [ "$action" = 'start' ]; then 
	cat <<- EOF > /etc/cron.d/ww3-"$game_id"
	*/1 * * * * sh -c 'import -window "$window_id" ~/ww3/$game_id/screen-$(date +%y-%m-%d-%H:%M:%S).png'
	EOF
elif [ "$action" == 'stop' ]; then
  rm -rf /etc/cron.d/ww3-"$game_id"
else
  echo $USAGE
fi

