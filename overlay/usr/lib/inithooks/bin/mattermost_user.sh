#!/bin/bash
platform="/opt/mattermost/bin"

username="$1"
password="$2"
email="$3"
teamname="$4"

function create ()
{
	cd $platform && ./platform -create_user -email="$email" -password="$password" -username="$username"
}
function assign ()
{
	cd $platform && ./platform -assign_role -email="$email" -role="system_admin"
}

if [ -e "$platform/platform" ]; then
	create $platform $email $password $username
	assign $platform $email
	exit 0
else:
	echo "There was a problem"
	exit 1
fi
