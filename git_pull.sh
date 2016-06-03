#!/bin/bash

thingml_dir="/thingml/ThingML"
testjar_dir="$thingml_dir/testJar"
log_dir="/thingml/web"
log_file="$log_dir/git_pull_log"

echo "Start" > $log_file
echo "Start"
cd $thingml_dir
echo "> git pull" >> $log_file
echo "> git pull"
git pull >> $log_file 2>&1
echo "> mvn clean install" >> $log_file
echo "> mvn clean install"
mvn clean install 2>> $log_file
cd $testjar_dir
echo "> mvn clean install" >> $log_file
echo "> mvn clean install"
mvn clean install 2>> $log_file
echo "> DONE" >> $log_file
