#!/bin/bash

/*
# Homework 1
- Create a directory named infra-hm in home directory.
- Inside infra-hm, create a file named note.txt and write anything in it.
- Copy note.txt to /tmp and rename it to note_tmp.txt.
- Delete the note.txt file from infra-hm.
*/

# Create a directory named infra-hm in home directory.
mkdir -p ~/infra-hm

# Inside infra-hm, create a file named note.txt and write anything in it.
echo "Hello, World!" > ~/infra-hm/note.txt


# Copy note.txt to /tmp and rename it to note_tmp.txt.
cp ~/infra-hm/note.txt /tmp/note_tmp.txt

# Delete the note.txt file from infra-hm.
rm ~/infra-hm/note.txt

