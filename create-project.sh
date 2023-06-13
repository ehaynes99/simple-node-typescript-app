#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Must supply a name"
  exit 1
fi

FULL_PATH=$(realpath "$1")

NAME=$(basename "$FULL_PATH")

if [[ -e "$FULL_PATH" ]]; then
  echo "path already exists: $(realpath "$FULL_PATH")"
  read -p "Open with nvim? [Y]/n" -n 1 -r
  echo ''
  if [[ ! $REPLY =~ ^[Nn]$ ]]; then
    cd "$FULL_PATH" || exit
    nvim
  fi
  exit 1
fi

mkdir -p "$FULL_PATH"
cd "$DIR" || (echo "$DIR does not exist" && return)
git clone git@github.com:ehaynes99/simple-node-typescript-app.git "$FULL_PATH"
cd "$FULL_PATH" || (echo "$FULL_PATH does not exist" && return)
find . -type f -exec perl -pi -e"s/library-example/${NAME}/g" {} +
npm i
rm -rf .git
rm -rf ./src/*
touch ./src/index.ts
rm create-project.sh
git init .
git add .
git commit -m"Create project"

read -p "Open with nvim? [Y]/n" -n 1 -r
echo ''
if [[ ! $REPLY =~ ^[Nn]$ ]]; then
	nvim
fi

