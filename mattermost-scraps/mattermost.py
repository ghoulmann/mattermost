#!/usr/bin/python
"""Set Mattermost admin user, password, email, and team name
Option:
    --password=     unless provided, will ask interactively
    --email=    unless provided, will ask interactively
    --teamname= unless provided, will ask interactively
    --username= unless provided, will ask interactively
"""

import sys
import getopt
#import inithooks_cache

#import crypt
#import random
#import hashlib

#from dialog_wrapper
#import Dialog
#from pgsqlconf import PostgreSQL
from subprocess import call
import subprocess
import shlex
def usage(s=None):
    if s:
        print >> sys.stderr, "Error:", s
    print >> sys.stderr, "Syntax: %s [options]" % sys.argv[0]
    print >> sys.stderr, __doc__
    sys.exit(1)

def main():
    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], "h",
                                       ['help', 'pass=', 'email=', 'teamname=', 'username='])
    except getopt.GetoptError, e:
        usage(e)

    password = ""
    email = ""
    teamname = ""
    username = ""
    for opt, val in opts:
        if opt in ('-h', '--help'):
            usage()
        elif opt == '--email':
            email = val
        elif opt == '--password':
            password = val
        elif opt == '--username':
            username = val
        elif opt == '--teamname':
            teamname = val

    if not username:
        username = raw_input("Enter a username for the Mattermost administrator: ")



    if not email:
        email = raw_input("Enter email address for the Mattermost 'admin' user: ")
    if not teamname:
        teamname = raw_input("Enter a name for the first Mattermost team: ")

    if not password:
        password = raw_input("Enter new password for the Mattermost administrator's  account: ")


    #create_user = "/opt/mattermost/bin/platform -create_user -team_name=\'%s\' -email=\'%s\' -password=\'%s\' -username=\'%s\'" % (teamname, email, password, username)
    #args = shlex.split(create_user)
    #p = subprocess.Popen(args)
    #role = "/opt/mattermost/bin/platform -assign_role -email=\'%s\' role='system_admin'" % (email)
    #args = shlex.split(role)
    #p = subprocess.Popen(args)
    bashcommand = "sh ./mattermost_user.sh %s %s %s %s" % (username, password, email, teamname)
    print bashcommand
    pieces = shlex.split(bashcommand)
    print pieces
    p = subprocess.call(pieces)
    print p
    


    #inithooks_cache.write('APP_EMAIL', email)





if __name__ == "__main__":
    main()
