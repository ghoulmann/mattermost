#!/bin/bash



platform="/opt/mattermost/bin"

username="$1"
email="$2"
password="$3"
teamname="$4"
if [ -e "$platform/platform" ]; then

	sh <<EOF
	$platform/platform -create_user -team_name="$teamname" -email="$email" -pasword="$password" --username="username"
	$platform/platform -assign_role -email="$email" role="system_admin"
EOF
	exit 0
else 
	echo "$platform/platform is not present."
        exit 1

fi

###Saved just in case
#$platform/platform -create_user -email="$email" -password="$password" -$
#$platform/platform -create_team -team_name="$teamname" -email="$email"
