#!/bin/sh

lastTag=$(cat tag)
currentTag=$(curl --silent 'https://api.github.com/repos/dreamhead/moco/tags?per_page=1' | grep name | sed -E 's/.*"([^"]+)".*/\1/')

if [ "$lastTag" != "$currentTag" ]
then
  echo "Current tag $currentTag is different than last built tag $lastTag => continue build"
  echo "$currentTag" > tag
else
  echo "Current tag $currentTag is the same as last built tag $lastTag => exit build"
  exit 1
fi
