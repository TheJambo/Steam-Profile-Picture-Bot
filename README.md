# Steam Avatar Bot
This is a short bash script that uses cURL to send a profile change request to Steam's servers.   
No exploits were used in the making of this script, as it does the same thing your Steam client or web browser would do.  
This script currently only runs on Linux, however there are [alternatives](https://github.com/Leystryku/steamavatarchange) available for Windows. If anyone would like to port this script to Windows, feel free to contact me on [Steam](http://steamcommunity.com/id/Andriux/).  

While using this script, keep in mind that Steam might change the way it handles requests and, as a consequence, this script might not work as intended.

## Getting Started
This was written entirely in Unix Bash, requires no additional dependencies, and is automatable with *crontab*.

### Prerequisities
* A working Linux installation. I used *Ubuntu 15.04 vivid* for developing, testing and debugging.
* Your Steam browser cookies. These are important to have, as the script does not implement logging into Steam on its own, and relies on pre-existing session cookies to be provided. Obtaining these will be explained in the next section.

### Obtaining Steam cookies
There are several ways of doing this. I'll be focusing on using Firefox, as I used this browser during testing.  
For both of my described methods, you will first have to sucessfully log into steam in Firefox.  
  
#### First method
The first method is to export cookies from Firefox using the [Export Cookies](https://addons.mozilla.org/en-US/firefox/addon/export-cookies/) addon. From the exported cookies.txt file, find the following lines:
```
steamcommunity.com	FALSE	/	FALSE	0	sessionid	eigiidremp266aivzm18ms1r
steamcommunity.com	FALSE	/	FALSE	0	steamCountry	US%7Ccd5b514bd466eb9171270b68eade43f8
steamcommunity.com	FALSE	/	FALSE	0	steamLogin	76561198053562138%7C%7CFHC7J6UE1QJE0GVNSPFC83JXNW1P0HYSKJCUZ2JI
```
* The first line is your *sessionid cookie*.  
* The second line is your *steamContry cookie*.  
* The third line is a combination of your *steam64ID* and *steamLoginSecure cookie*. It is combined in the following way:
```
{steamID64}%7C%7C{steamLoginSecure cookie}
```
  
Note these down somewhere for when setting up the config.cfg file.

#### Second method
The second method is to look at the cookies used in page requests, when browsing *steamcommunity.com*. In Firefox, this can be done using [Firebug](https://getfirebug.com/).  
After installing and launching Firebug, go to any page on *steamcommunity.com* (for example, your Steam profile page).  
In Firebug, go to the **Net** tab, and **All** section. Find the **GET /id/yourID/** request (or similar), and look at the **Cookies** section of the request. For convenience, this is illustrated in a picture below.  
  
![Firebug cookie guide](http://i.imgur.com/VqSffu0.png)
  
Find the appropriate cookie values and treat them like in the first method (except *%7C* becomes *|*)  
  
Again, note these down somewhere for when setting up the config.cfg file.

### Setting up the script
By default, the script expects itself to be in the following directory:
```
/home/user/Documents/SteamAvatarBot
```
This is where the script expects the *config.cfg* file to be in and was done to allow the script to be automatable.  
To have it run somewhere else, you will have to change the *$scriptFolder* variable (*line 20* in *change.sh*).

### Setting up config.cfg
The config.cfg file consists of a total of 7 lines.
* Line 1 - The *location of the picture folder*. By default it is set to the following directory
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