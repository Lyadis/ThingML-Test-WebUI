#!/bin/bash

thingml_dir="/thingml/ThingML"
testjar_dir="$thingml_dir/testJar"
log_dir="/thingml/web"
log_file="$log_dir/run_tests_log"

echo "> Start"
cd $testjar_dir

echo "> rm -r *_testDir"
rm -r *_testDir

echo "sed -i '/^languageList=arduino/languageList=posix, posixmt, java, javascript/' config.properties"
sed -i '/^languageList=arduino/languageList=posix, posixmt, java, javascript/' config.properties

echo "> mv classicBalancer.properties loadBalancer.properties"
mv classicBalancer.properties loadBalancer.properties

echo "> java -cp .:target/testJar-0.7.0-SNAPSHOT-jar-with-dependencies.jar org.thingml.loadbalancer.LoadBalancer"
java -cp .:target/testJar-0.7.0-SNAPSHOT-jar-with-dependencies.jar org.thingml.loadbalancer.LoadBalancer

echo "> ./dispatch.sh"
./dispatch.sh

echo "> DONE"


