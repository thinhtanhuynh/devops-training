#!/bin/bash

/*
# Homework 2
- Use grep to find all files in /etc containing the word "password".
- Extract only the IP addresses from ifconfig or ip a.
- Format the output of df -h to show only disk name, size, and usage percentage.
- Create a file contains 1000 lines with random text and replace all instances of “w” to “q” using sed.
- Create a file called secrets.txt and set the permissions so that:
- The owner can read and write.
- The group can only read.
- Others cannot access it.
*/

# Use grep to find all files in /etc containing the word "password".
grep -r "password" /etc

# Extract only the IP addresses from ifconfig or ip a.
ifconfig | grep -Eo 'inet [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | awk '{print $2}'

# Format the output of df -h to show only disk name, size, and usage percentage.
df -h | awk '{print $1, $2, $5}'

# Create a file contains 1000 lines with random text and replace all instances of “w” to “q” using sed.
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 1000 | head -n 1000 > random_text.txt
sed -i 's/w/q/g' random_text.txt

# Create a file called secrets.txt and set the permissions so that:
# - The owner can read and write.
# - The group can only read.
# - Others cannot access it.
echo "This is a secret file." > secrets.txt
chmod 640 secrets.txt
