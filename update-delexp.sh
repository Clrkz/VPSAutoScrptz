#!/bin/bash

# current time in seconds
datenow=$(date +%s)

# loop over all users
for user in $(awk -F: '{print $1}' /etc/passwd); do

# get date of expiration of users that have exp. date set
expdate=$(chage -l $user|awk -F: '/Account expires/{print $2}')
echo $expdate | grep -q never && continue

echo -n "User \`$user' expired on $expdate "

# convert exp. date to seconds
expsec=$(date +%s --date="$expdate")

# calculate diff b/t time now and exp. date
diff=$( echo $datenow - $expsec)

# if a negative number, hasn't expired yet
echo $diff | grep -q ^\- && echo okay && continue
printf ""

# it will ask every user that will deleted, if you want to disable the feature you can add "#" in 3 lines
read -r -p "Are you sure you want to delete this user? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then

# got this far, account must have expired
echo deleting $user ...

# deleting user
userdel -r $user

# if you want to disable the 'ask' feature you can add "#" in 3 lines
else
exit
fi
done
