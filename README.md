home-folder-in-dropbox
======================

Copies home folder files into the Dropbox folder

New home folder is placed in a folder named after provided initials, which can serve as a share point.

Assumes Dropbox is already linked, located in home folder

Three options for arguments:
* 1st: [initials] [shortname] [org name]  
     For Dropbox for Business. Creates new home folder as /Users/[shortname]/Dropbox ([org name])/[initials]/[shortname]  
     The DfB orgazition name should be given in quotes if it contains a space.
* 2nd: [initials] [shortname]  
     For non DfB accounts. Creates new home folder as /Users/[shortname]/Dropbox/[initials]/[shortname]   
*3rd: [shortname]
     For non DfB accounts. Creates new home folder as /Users/[shortname]/Dropbox/[shortname]  

If you want to set Selective Sync (recommend you at least unsync .dropbox and .dropbox-master),
run script again to recopy the folders that Selective Sync removes
Needs to be called with superuser privs, or else Libary won't copy correctlyScript for preparing to put OSX home folder inside Dropbox folder

Copies home folder files for current user into the Dropbox folder


