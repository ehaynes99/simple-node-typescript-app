#!/usr/bin/env bash
if [ "$#" -ne 1 ]
then
  echo "Must supply a name"
  exit 1
fi

NAME="$1"
git clone git@github.com:ehaynes99/simple-node-typescript-app.git $NAME
cd $NAME
find . -type f -exec perl -pi -e"s/simple-node-typescript-app/${NAME}/g" {} +
npm i
rm -rf .git
rm -rf ./src/*
touch ./src/index.ts
rm create-project.sh
git init .
git add .
git commit -m"Create project"
code .
