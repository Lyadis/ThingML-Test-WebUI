#!/bin/bash

thingml_dir="/thingml/ThingML"
testjar_dir="$thingml_dir/testJar"
log_dir="/thingml/web"
log_file="$log_dir/git_pull_log"

#function filter {
#	while read line
#	do 
#		printf "$line\n" | grep "ERROR"
#		printf "$line\n" | grep "BUILD SUCCESS"
#	done
#	grep 'ERROR\|BUILD SUCCESS'
#}

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
mvn clean install | grep 'ERROR\|BUILD SUCCESS'
#Go to test dir
cd $testjar_dir

echo "> mvn clean install"
mvn clean install | grep 'ERROR\|BUILD SUCCESS'
echo "> DONE"



