#!/bin/bash
#
# Copies home folder files for current user into the Dropbox folder
#
# New home folder is placed in a folder named after provided initials, which can serve as a share point.
#
# Assumes Dropbox is already linked, located in home folder
#
# Two options for arguments: 
# 1st: [initials] [shortname]  [org name] 
#     For Dropbox for Business. Creates new home folder as [currenthome]/Dropbox ([org name])/[initials]/[username]
#     The DfB orgazition name should be given in quotes if it contains a space.
# 2nd: [initials] [shortname]
#     For non DfB accounts. Creates new home folder as [currenthome]/Dropbox/[initials]/[username]
# 3rd: [shortname]
#     For non DfB accounts. Creates new home folder as [currenthome]/Dropbox/[username]
#     Might as well make it available; it's almost too easy not to.
#
# Needs to be called with superuser privs, or else Libary won't copy correctly
#
# If you want to set Selective Sync (recommend you at least unsync .dropbox and .dropbox-master),
# run script again to recopy the folders than Selective Sync removes

# It checks for the two-argument version first to optimize for my more common use-case
if [ $# == 3 ]
then
NEWHOME=~/Dropbox\ \("$3"\)/"$1"/"$2"
elif [ $# == 1 ]
then
NEWHOME=~/Dropbox/"$1"/"$2"
elif [ $# == 0 ]
then
NEWHOME=~/Dropbox/"$1"
else
echo "ERROR: Incorrect Arguments"
exit 1
fi

# For testing purposes, echo the Home path that the if statements created
echo "Create folder: "$NEWHOME""

# Make the new home folder and the folders beneath it in the hierarchy
mkdir -p "$NEWHOME"

exit 0
