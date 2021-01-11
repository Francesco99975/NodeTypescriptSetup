#! /usr/bin/bash

# creating root project directory
if [ $# -eq 0 ]
then
    echo "Invalid or Unprovided Arguments" && exit
fi

mkdir $1 || exit
echo "Creating Project Directory..."

#create src directory with app.ts
mkdir $1/src
touch $1/src/app.ts

#create .vscode config
mkdir $1/.vscode
cd $1/.vscode
wget https://github.com/Francesco99975/NodeTypescriptSetup/releases/download/1.0/launch.json
cd ..

#create .gitignore
touch .gitignore
printf "node_modules\n.vscode\nnodemon.json\ndist\ncompiler.sh\npackage-adapter.py\n.env" > .gitignore

#create tsconfig
wget https://github.com/Francesco99975/NodeTypescriptSetup/releases/download/1.0/tsconfig.json

#initialize project with npm
npm init

#setup git 
git init

#install typescript
npm i typescript

#install nodemon and @types/node as dev dependency
npm i nodemon @types/node tsc-watch --save-dev

#download compiler script
wget https://github.com/Francesco99975/NodeTypescriptSetup/releases/download/1.0/package-adapter.py

#give execution permission to compiler script
chmod +x package-adapter.py

#execute adapter script to adapt package.json to typescript development
./package-adapter.py

#remove adapter script
rm package-adapter.py

#crate nodemon.json
wget https://github.com/Francesco99975/NodeTypescriptSetup/releases/download/1.0/nodemon.json