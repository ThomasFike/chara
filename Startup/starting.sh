#! /bin/bash
echo "starting"
sleep 5
#get display size info
display=$(wmctrl -d | grep "Workspace 2"| cut -f4 -d:)
display=$(echo $display | cut -f2 -d\ )
horizontal=$(echo $display | cut -f1 -dx)
vert=$(echo $display | cut -f2 -dx)
half=$(( horizontal / 2 ))
echo $half

#
# Teams and Slack
#

#launch teams and slack
slack > /dev/null 2>&1 &
teams
sleep 5

#send to workspace 3
wmctrl -r "Slack" -t 2
wmctrl -r "Teams" -t 2

#move and resize
wmctrl -r "Slack" -e 0,$half,$vert,$half,$vert
wmctrl -r "Teams" -e 0,0,0,$half,$vert

#
# Outlook, Calendar, Todoist
#
sleep 1
#Lauch Chromium
chromium https://outlook.office.com/mail/inbox https://outlook.office.com/calendar/view/week https://todoist.com/app
sleep 5

#Move to workspace 2
echo 'wmctrl -r "Chromium" -t 1'

#Make full scrren
echo 'wmctrl -r "Chromium" -e 0,0,0,$horizontal,$vert'

wmctrl -s 0
echo "Done!"
