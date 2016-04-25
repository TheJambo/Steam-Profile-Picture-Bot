# Steam Avatar Bot
This is a short *Bash script* that uses *cURL* to send a profile change request to Steam's servers.   
No bugs or exploits have been used in the making of this script, as it does the same thing your Steam client or web browser would do.  
This script currently only runs on Linux, however there are [alternatives](https://github.com/Leystryku/steamavatarchange) available for Windows. If anyone would like to port this script to Windows, feel free to do so.  

While using this script, keep in mind that Steam might change the way it handles requests and, as a consequence, this script might no longer work as intended.

## Getting Started
This script was written entirely in Unix Bash, and requires no additional libraries.

### Prerequisites
* A working Linux installation. I used *Ubuntu 15.04 vivid* for developing, testing and debugging.
* Some experience with websites and script debugging might help.

### Obtaining Steam cookies
These are important to have, as the script does not implement logging into Steam on its own, and relies on pre-existing session cookies to be provided.  
There are several ways of obtaining Steam cookies. I will be focusing on using Firefox, as I used this browser during testing.  
For both of my described methods, you will first have to successfully  log into steam in Firefox.  
  
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
* Line 3 - The *current avatar* that is used. Set this to 1 when setting up.
* Line 4 - Your *sessionid cookie*.
* Line 5 - Your *steamID64*.
* Line 6 - Your *steamLoginSecure cookie*. 
* Line 7 - Your *steamContry cookie*.
Make sure the values are on the exact lines specified, with no extra whitespace.  

### Setting up the pictures folder
For now, the script uses a very rough way of file handling.  
All of the pictures must be numbered from 1 to *n* (*total amount of pictures*), and must be in *.png* file format. If you want to use another file format, modify the script on *line 56*.

## Using the script
There are two ways of using this script.  
### Manual mode
One way is to manually launch it every time you want a new profile picture. This can be done by executing:
```
bash <script path>/change.sh
```
For now, the CLI is very basic, and does not offer much debug ability. However, the script can be modified to do so.  
You may add the following command to the script:
```
echo $output
```
This will output the response from the POST request, and can provide insight to errors.  
Also, *-s* can be removed from the curl command to see all of the request data.

### Automatic mode
For automating the profile picture change, *crontab* can be used. Sample crontab command:
```
0, 30 * * * * bash ~/Documents/SteamAvatarBot/change.sh
```

## Known issues
After further testing of v1.0 of the script, the following issues have appeared:
* Running the script on a Raspberry Pi requires some variable cleaning (removing *\t* from every line read from the *config.cfg* file).
* Steam cookies might expire and cause the POST requests to fail.  
I will try adressing these in further releases.

## Final words
This is one of my first Bash scripts ever written, so do not hold any mistakes against me.  
I am not sure about my stance on providing support. You can certainly try contacting me for support, but do not expect me to fix every issue you might have. I managed to get this working from scratch in around 5 hours, so you should too.  

If you do have any questions, you can contact me on [Steam](http://steamcommunity.com/id/Andriux/).  

## Acknowledgments
* [Stackoverflow](https://stackoverflow.com/), for being Stackoverflow.
* [Leystryku](https://github.com/Leystryku), whose code I found near the end of development. Helped narrow down some issues I was having.