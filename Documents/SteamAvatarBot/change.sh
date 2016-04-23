#!/bin/bash

#Color bindings
  ERROR='\e[0;31m'
SUCCESS='\e[0;32m'
   INFO='\e[0;35m'
 CONFIG='\e[0;34m'
  GREEN='\e[1;32m'
 PURPLE='\e[1;36m'
  WHITE='\e[1;37m'
   GREY='\e[0;37m'
     NC='\e[0m'

#Intro message
clear
printf "      -= ${WHITE}Steam Profile Picture Bot${NC} =- \n"
printf " -= Written by ${PURPLE}Andriux${NC}, powered by ${GREEN}cURL${NC} =- \n"

#Reads config file
scriptFolder="/home/plastic/Documents/SteamAvatarBot"
pictureFolder="`sed -n 1p ${scriptFolder}/config.cfg`"
maxAvatar="`sed -n 2p ${scriptFolder}/config.cfg`"
currentAvatar="`sed -n 3p ${scriptFolder}/config.cfg`"
uploadURL="http://steamcommunity.com/actions/FileUploader"

sessionID="`sed -n 4p ${scriptFolder}/config.cfg`"
steamID64="`sed -n 5p ${scriptFolder}/config.cfg`"
authCode="`sed -n 6p ${scriptFolder}/config.cfg`"
countryCode="`sed -n 7p ${scriptFolder}/config.cfg`"

#Variable output for user
printf "    ${CONFIG}CONFIG${NC}: Pictures Folder: ${GREY}${pictureFolder}${NC}\n"
printf "    ${CONFIG}CONFIG${NC}: Amount of Saved Avatars: ${GREY}${maxAvatar}${NC}\n"
printf "    ${CONFIG}CONFIG${NC}: Current Avatar: ${GREY}${currentAvatar}${NC}\n"

#Increments avatar counter
pic=$[$currentAvatar+1]
if [ "$pic" -gt "$maxAvatar" ]
then
	pic=1
fi

#Updates file with counter
sed -i "3i${pic}" "${scriptFolder}/config.cfg"
sed -i "4d" "${scriptFolder}/config.cfg"

#Sends cURL request to Steam uploader
printf "    ${INFO}INFO${NC}: Sending Request\n"
output=$(curl -s \
-H "Content-Type: multipart/form-data" \
-b "sessionid=${sessionID}; steamCountry=${countryCode}; steamLogin=${steamID64}%7C%7C${authCode};" \
-F "type=player_avatar_image" \
-F "sId=${steamID64}" \
-F "sessionid=${sessionID}" \
-F "doSub=1" \
-F "avatar=@${pictureFolder}/${pic}.png" \
$uploadURL)

#Checks if request was successful
length=${#output}
if [ "${length}" -gt "100" ]
then
	printf "    ${SUCCESS}SUCCESS${NC}: Changed Profile Picture\n"
else
	printf "    ${ERROR}FAILURE${NC}: ${output}\n"
fi
printf "    ${INFO}INFO${NC}: Ending Process\n"

exit
