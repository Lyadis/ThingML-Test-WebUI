#!/bin/bash

thingml_dir="/thingml/ThingML"
testjar_dir="$thingml_dir/testJar"
log_dir="/thingml/web"
log_file="$log_dir/run_tests_log"

echo "Start"
echo "Start" > $log_file
cd $testjar_dir

echo "> rm -r m*_testDir"
echo "> rm -r m*_testDir" >> $log_file
rm -r m*_testDir >> $log_file 2>&1

echo "> java -cp .:target/testJar-0.7.0-SNAPSHOT-jar-with-dependencies.jar org.thingml.loadbalancer.LoadBalancer"
echo "> java -cp .:target/testJar-0.7.0-SNAPSHOT-jar-with-dependencies.jar org.thingml.loadbalancer.LoadBalancer" >> $log_file
java -cp .:target/testJar-0.7.0-SNAPSHOT-jar-with-dependencies.jar org.thingml.loadbalancer.LoadBalancer >> $log_file 2>&1

echo "> ./dispatch.sh"
echo "> ./dispatch.sh" >> $log_file
./dispatch.sh >> $log_file 2>&1

echo "> DONE"
echo "> DONE" >> $log_file


