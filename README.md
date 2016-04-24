# Steam Avatar Bot
This is a basic bash script that uses cURL to send a profile change request to Steam's servers. No exploits were used in the making of this script, as it does the same thing your Steam client or web browser would do.

## Getting Started
This was written entirely in Unix Bash, and requires no additional dependencies (apart from a Linux installation), and is automatable with crontab.
### Prerequisities
A working Linux installation. I used Ubuntu 15.04 vivid for developing, testing and debugging.

###Setting up
By default, the script expects itself to be in the following directory:
```
/home/user/Documents/SteamAvatarBot
```
This is where the script expects the *config.cfg* file to be in and was done to allow the script to be automatable.  
To have it run somewhere else, you will have to change the *$scriptFolder* value (*line 20* in *change.sh*).


While following these instructions, keep in mind that 

more detailed description coming in a commit near you