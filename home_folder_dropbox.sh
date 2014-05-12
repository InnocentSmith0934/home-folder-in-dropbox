#!/bin/bash
#
# Copies home folder files into the Dropbox folder
#
# New home folder is placed in a folder named after provided initials, which can serve as a share point.
#
# Assumes Dropbox is already linked, located in home folder
#
# Three options for arguments: 
# 1st: [initials] [shortname] [org name] 
#     For Dropbox for Business. Creates new home folder as /Users/[shortname]/Dropbox ([org name])/[initials]/[shortname]
#     The DfB orgazition name should be given in quotes if it contains a space.
# 2nd: [initials] [shortname]
#     For non DfB accounts. Creates new home folder as /Users/[shortname]/Dropbox/[initials]/[shortname]
# 3rd: [shortname]
#     For non DfB accounts. Creates new home folder as /Users/[shortname]/Dropbox/[shortname]
#
# If you want to set Selective Sync (recommend you at least unsync .dropbox and .dropbox-master),
# run script again to recopy the folders that Selective Sync removes
#
# Needs to be called with superuser privs, or else Libary won't copy correctly
#


# Initial configuration variables
if [ $# == 3 ]
then
  SNAME="$2"
  NEWHOME=/Users/"$SNAME"/Dropbox\ \("$3"\)/"$1"/"$SNAME"
elif [ $# == 2 ]
  then
  SNAME="$2"
  NEWHOME=/Users/"$SNAME"/Dropbox/"$1"/"$SNAME"
elif [ $# == 1 ]
  then
  SNAME="$1"
  NEWHOME=/Users/"$SNAME"/Dropbox/"$SNAME"
else
  echo "Invalid user set. Use one of three valid argument sets:"
  echo "[Initials] [User Shortname] [Org Name]"
  echo "[Initials] [User Shortname]"
  echo "[User Shortname]"
  exit 1
fi


# Make the new home folder if it doesn't already exist
if [ -d "$NEWHOME" ]
  then
  echo "Folder already exists: "$NEWHOME""
else
  mkdir -p "$NEWHOME"
  echo "Created folder: "$NEWHOME""
  chown -R "$SNAME" "$NEWHOME"/.. # Running mkdir with sudo can cause the folder to be owned by root.
fi

# Status update after each folder, to know if/on which folder the ditto command might be hanging up. 
echo "Copy home folder to "$NEWHOME""
ditto ~/Documents "$NEWHOME"/Documents
echo "Copied: Documents"
ditto ~/Downloads "$NEWHOME"/Downloads
echo "Copied: Downloads"
ditto ~/Desktop "$NEWHOME"/Desktop
echo "Copied: Desktop"
ditto ~/Movies "$NEWHOME"/Movies
echo "Copied: Movies"
ditto ~/Music "$NEWHOME"/Music
echo "Copied: Music"
ditto ~/Pictures "$NEWHOME"/Pictures
echo "Copied: Pictures"
ditto ~/Public "$NEWHOME"/Public
echo "Copied: Public"
ditto ~/.dropbox-master "$NEWHOME"/.dropbox-master
echo "Copied: .dropbox-master"
ditto ~/.dropbox "$NEWHOME"/.dropbox
echo "Copied: .dropbox"
ditto ~/Library "$NEWHOME"/Library
echo "Copied: Library"

exit 0

# Copyright (c) 2014 Kevin White
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
