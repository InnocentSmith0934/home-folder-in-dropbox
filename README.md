home-folder-in-dropbox
======================

Script for preparing to put OSX home folder inside Dropbox folder

Copies home folder files for current user into the Dropbox folder

New home folder is placed in a folder named after provided initials, which can serve as a share point.

Assumes Dropbox is already linked, located in home folder


Two options for arguments:

* 1st: [initials] [org name]  
   For Dropbox for Business.  
   Creates new home folder as [currenthome]/Dropbox ([org name])/[initials]/[username]  
   The DfB orgazition name should be given in quotes if it contains a space.  
* 2nd: [initials]  
   For non DfB accounts. Creates new home folder as [currenthome]/Dropbox/[initials]/[username]  
* 3rd: no argument  
For non DfB accounts. Creates new home folder as [currenthome]/Dropbox/[username]  
Might as well make it available; it's almost too easy not to.


Needs to be called with superuser privs, or else Libary won't copy correctly


If you want to set Selective Sync (recommend you at least unsync .dropbox and .dropbox-master), run script again to recopy the folders than Selective Sync removes

