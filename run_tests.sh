#!/bin/bash

thingml_dir="/thingml/ThingML"
testjar_dir="$thingml_dir/testJar"
log_dir="/thingml/web"
log_file="$log_dir/run_tests_log"

echo "> Start"
cd $testjar_dir

echo "> rm -r m*_testDir"
rm -r m*_testDir

echo "> java -cp .:target/testJar-0.7.0-SNAPSHOT-jar-with-dependencies.jar org.thingml.loadbalancer.LoadBalancer"
java -cp .:target/testJar-0.7.0-SNAPSHOT-jar-with-dependencies.jar org.thingml.loadbalancer.LoadBalancer

echo "> ./dispatch.sh"
./dispatch.sh

echo "> DONE"


