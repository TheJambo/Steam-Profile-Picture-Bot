# Steam Avatar Bot
This is a short bash script that uses cURL to send a profile change request to Steam's servers.   
No exploits were used in the making of this script, as it does the same thing your Steam client or web browser would do.  
While following these instructions, keep in mind that Steam might change the way it handles requests and, as a consequence, this script might not work anymore.

## Getting Started
This was written entirely in Unix Bash, requires no additional dependencies, and is automatable with crontab.
### Prerequisities
A working Linux installation. I used *Ubuntu 15.04 vivid* for developing, testing and debugging.

###Setting up the script
By default, the script expects itself to be in the following directory:
```
/home/user/Documents/SteamAvatarBot
```
This is where the script expects the *config.cfg* file to be in and was done to allow the script to be automatable.  
To have it run somewhere else, you will have to change the *$scriptFolder* variable (*line 20* in *change.sh*).

###Setting up config.cfg
The config.cfg file consists of a total of 7 lines:
* Line 1 - The location of the picture folder. By default it is set to the following directory
```
/home/User/Pictures/SteamAvatarBot
```
You may leave this as it is, or change it to something else.
* Line 2 - Set this to the *total amount of avatars* in the folder. The script currently does not implement folder browsing, thus iterating the filename is used.
* Line 3 - The *current avatar* that is used. Set this to 0 when setting up.
* Line 4 - Your *sessionid cookie*.
* Line 5 - Your *steam64ID*.
* Line 6 - Your *steamLoginSecure cookie*. 
* Line 7 - Your *steamContry cookie*.


more detailed description coming in a commit near you