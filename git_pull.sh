#!/bin/bash

thingml_dir="/thingml/ThingML"
testjar_dir="$thingml_dir/testJar"
log_dir="/thingml/web"
log_file="$log_dir/git_pull_log"

echo "> Start"
echo "> mv to thingml dir"
cd $thingml_dir
echo "> save old config"
mv $testjar_dir/config.properties $testjar_dir/old.properties
echo "> git pull"
git pull
echo "> restore old config"
mv $testjar_dir/old.properties $testjar_dir/config.properties
echo "> mvn clean install"
mvn clean install 2>> $log_file
cd $testjar_dir
echo "> mvn clean install"
mvn clean install 2>> $log_file
echo "> DONE"
