clear

#First startup screen
echo "--- Steam Profile Picture Bot ---"
echo "Please enter username and password."

#Gets user info
read -p "Username: " username
read -s -p "Password: " password

#Logs into Steam
printf "\n\nLogging in..."
$loginURL = "https://steamcommunity.com/login/home/index.php"


wget --save-cookies cookies.txt --keep-session-cookies --post-data="username="+$username+"&password="+$password $loginURL
