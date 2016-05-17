#!/bin/bash -ex

username=""
password=""
email=""
teamname=""

while true ; do
  case "$1" in
    --username) username="$2" ; shift 2 ;;
    --password) password="$2" ; shift 2 ;;
    --email) email="$2" ; shift 2 ;;
    --teamname) teamname="$2"; shift 2;;
    *) break ;;
  esac
done

