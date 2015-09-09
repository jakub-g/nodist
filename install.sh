#!/bin/bash

# copy pre-committed node_modules and and npm to make them available
echo -e "Copying temporary dependencies and npm to get started..."

# removing folders because cp -R is non-idempotent!
rm -rf node_modules
cp -R .node_modules node_modules
rm -rf bin/node_modules
cp -R bin/.node_modules/ bin/node_modules

# update npm
echo -e "\nUpdating npm"
cmd //C npm install -g npm

# update dependencies
cmd //C nodist selfupdate

echo -e "\nInstalled node version:"
(cd ~ && node -v) # trick needed since there's an old node.exe in nodist dir itself!

echo -e "\nInstalled npm version:"
npm -v
