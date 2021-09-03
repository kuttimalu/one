#!/bin/bash
#This will work on the assumption that the user will enter 2  Locations where an xml file, $XML_FILE exists in each loaction and will replace the password of the user $USERNAME 
#Replace XML_FILE and USER_NAME with the your environment's values .

XML_FILE=pod.xml
USER_NAME=epappuser
for i in 1 2
do 
read -p 'Location :' loc
if [ -f "${loc}/pod.xml" ] 
then 
read -p 'Passcode :' Code
echo "Your password is $Code"
export ${Code}
grep ${USER_NAME} ${XML_FILE} | sed -e "s/password=[^[:space:]]*/password="${Code}" /g"
fi
done
echo "Hello"
