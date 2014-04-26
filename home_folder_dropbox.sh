#! /bin/bash
# Moves home folder files into the Dropbox folder
# Assumes it being used with Dropbox for Business with the new folder structure
# Assumes Dropbox is already linked, located in home folder
# If using for plain Dropbox account, remove the third argument and its references
# Takes three arguments: [initials] [shortname] [org name]
# Needs to be called with superuser privs

NEWHOME=~/Dropbox\ \("$3"\)/"$1"/"$2"

echo $NEWHOME
echo "$NEWHOME"

mkdir -p "$NEWHOME"

exit 0
