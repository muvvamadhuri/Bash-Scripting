#!/bin/bash
read -p "Enter the absolute path of the file: " FILE
echo "Automated mail from Mutt" | mutt -s "Testing Mail from Mutt" muvva.m@northeastern.edu -a $FILE
echo "Mail sent to muvva.m@northeastern.edu"
