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
	if [ $? > 0]; then
		echo "create-user returned an error."
		exit 1
	fi

	assign $platform $email
	if [ $? > 0 ]; then
		echo "assign-role failed."
		exit 1
	fi
	exit 0
else:
	echo "The executable /opt/mattermost/bin/platform was not found."
	exit 1
fi
