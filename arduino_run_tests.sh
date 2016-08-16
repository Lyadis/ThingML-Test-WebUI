#!/bin/bash

thingml_dir="/thingml/ThingML"
testjar_dir="$thingml_dir/testJar"
log_dir="/thingml/web"
log_file="$log_dir/run_tests_log"

echo "> Start"
cd $testjar_dir

echo "> rm -r *_testDir"
rm -r *_testDir

echo "sed -i 's/languageList=.*/languageList=arduino/g' config.properties"
sed -i 's/languageList=.*/languageList=arduino/g' config.properties

echo "> cp arduinoBalancer.properties loadBalancer.properties"
cp arduinoBalancer.properties loadBalancer.properties

echo "> java -cp .:target/testJar-0.7.0-SNAPSHOT-jar-with-dependencies.jar org.thingml.loadbalancer.LoadBalancer"
java -cp .:target/testJar-0.7.0-SNAPSHOT-jar-with-dependencies.jar org.thingml.loadbalancer.LoadBalancer

echo "> ./dispatch.sh"
./dispatch.sh


echo "> DONE"


