#!/bin/bash
platform="/opt/mattermost/bin"

username="$1"
password="$2"
email="$3"
teamname="$4"

<<<<<<< HEAD

lines=<<EOF
$platform/platform -create_user -team_name="$teamname" -email="$email" -pasword="$password" --username="username"
$platform/platform -assign_role -email="$email" role="system_admin"
EOF
echo $lines


###Saved just in case
#$platform/platform -create_user -email="$email" -password="$password" -$
#$platform/platform -create_team -team_name="$teamname" -email="$email"
=======
function create ()
{
	cat << EOF	
$platform/platform -create_user -email="$email" -password="$password" -username="$username"
EOF
	cd $platform && ./platform -create_user -email="$email" -password="$password" -username="$username"

}
function assign ()
{
	cat << EOF
$platform/platform -assign_role -email="$email" -role="system_admin"
EOF
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
>>>>>>> 3c036c0ccae8ffc5faf6d9f402fdbd5362de702c
