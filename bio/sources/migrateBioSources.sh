#!/bin/sh
for dir in `ls -d */`
do
prj="${dir%%/}"

cd $prj
  if [ -d main ]
    then
    echo "Converting $prj project to gradle"
    cd $prj
    echo "Creating src dir"
    mkdir -p src
    echo "Moving main dir under src ..."
    git mv main/ src/
    cd src/main
    git mv src java
    echo "Done!"
    cd ../..
  fi

  
  if [ -d test ]
  then
    echo "Moving test dir under src ..."
    git mv test/ src/
    cd src/test
    git mv src java
    echo "Done!"
    cd ../..   
  fi

  cp ../skeleton-build.gradle build.gradle
  echo "Created a build.gradle skeleton"

  if [ -d resources ]
    then
      git mv resources/* src/main/resources/
      rm -r resources/
  fi
cd ..

done
