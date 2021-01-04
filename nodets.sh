#! /usr/bin/bash

# creating root project directory
if [ $# -eq 0 ]
then
    echo "Invalid or Unprovided Arguments" && exit
fi

mkdir $1 && 
echo "Creating Project Directory..." || 
echo "Could not create directory! Try another name..." && exit

#create src directory with app.ts
mkdir $1/src
touch $1/src/app.ts

#create .vscode


#create .gitignore

#create tsconfig

#run npm init -y

#run git init

#run npm i typescript

#run npm i nodemon --save-dev

#crate nodemon.json