home-folder-in-dropbox
======================

This script copies the standard OSX home folder and its standard subfolders into the Dropbox folder.

The new home folder is placed in a folder named after the provided initials. That parent folder can serve as a share point for archiving home folder contents in another Dropbox for Business account.

This script assumes that Dropbox is already linked and that its setting files are located in the home folder. I recommend quitting the Dropbox application before running the script.

There are three options for arguments:
* 1st: [initials] [shortname] [org name]  
     For Dropbox for Business users. It creates a new home folder as /Users/[shortname]/Dropbox ([org name])/[initials]/[shortname]  
     The DfB orgazition name should be given in quotes if it contains a space or other reserved character.
* 2nd: [initials] [shortname]  
     For non DfB accounts. It creates a new home folder as /Users/[shortname]/Dropbox/[initials]/[shortname]  
* 3rd: [shortname]
     For non DfB accounts. It creates a new home folder as /Users/[shortname]/Dropbox/[shortname]  

The script needs to be called with superuser privs. Without elevated priviledges, ditto won't be able to copy the Libary foldervcorrectly or preserve resource forks.
