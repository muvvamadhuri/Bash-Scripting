import os
os.system("git init")
os.system("git remote add origin git@github.com:muvvamadhuri/Bash-Scripting.git")
os.system("git config --global user.email 'muvva.m@northeastern.edu'")
os.system("git config --global user.name 'muvvamadhuri'")
os.system("git add ~/Desktop/index.html ")
os.system("git commit -m 'test'")
os.system("git push --force origin master")
