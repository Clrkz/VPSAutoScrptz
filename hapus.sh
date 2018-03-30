#!/bin/bash
#Script to remove SSH & OpenVPN users

read -p "SSH user name will be deleted : " Users

if getent passwd $Users > /dev/null 2>&1; then
        userdel $Users
        echo -e "User $Users was removed."
else
        echo -e "FAILED: there is no User $Users ."
fi
