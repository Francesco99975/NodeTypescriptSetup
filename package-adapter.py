#! /usr/bin/python

import json

with open("package.json", "r", encoding="utf-8") as file:
    jsonObject = json.load(file)

    jsonObject["main"] = "./dist/app.js"
    jsonObject["scripts"][
        "start"
    ] = """tsc && rsync -av --progress --exclude={'*.ts*','nodemon.json','tsconfig.json','dist','.vscode','node_modules','src','.git'} . ./dist && node ./dist/app.js"""
    jsonObject["scripts"][
        "start:dev"
    ] = """tsc && rsync -av --progress --exclude={'*.ts*','nodemon.json','tsconfig.json','dist','.vscode','node_modules','src','.git'} . ./dist && tsc-watch --project . --onSuccess 'nodemon ./dist/app.js'"""

with open("package.json", "w+", encoding="utf-8") as file:
    json.dump(jsonObject, file, indent=2)