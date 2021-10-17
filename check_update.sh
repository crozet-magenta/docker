#!/bin/sh

lastTag=$(cat tag)
currentTag=$(curl --silent 'https://api.github.com/repos/dreamhead/moco/tags?per_page=1' | grep name | sed -E 's/.*"([^"]+)".*/\1/')

if [ "$lastTag" != "$currentTag" ]
then
  echo "Current tag $currentTag is different than last built tag $lastTag => continue build"
  echo "$currentTag" > tag
  echo "EXIT=false" >> $GITHUB_ENV
else
  echo "Current tag $currentTag is the same as last built tag $lastTag => exit build"
  echo "EXIT=true" >> $GITHUB_ENV
fi
