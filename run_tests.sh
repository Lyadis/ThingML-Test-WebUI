#!/bin/bash
#
# Copyright (C) 2014 SINTEF <franck.fleurey@sintef.no>
#
# Licensed under the GNU LESSER GENERAL PUBLIC LICENSE, Version 3, 29 June 2007;
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# 	http://www.gnu.org/licenses/lgpl-3.0.txt
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


thingml_dir="/thingml/ThingML"
testjar_dir="$thingml_dir/testJar"
log_dir="/thingml/web"
log_file="$log_dir/run_tests_log"

echo "> Start"
cd $testjar_dir

echo "> rm -r *_testDir"
rm -r *_testDir

<<<<<<< HEAD
echo "sed -i '/^languageList=arduino/languageList=posix, posixmt, java, javascript/' config.properties"
sed -i '/^languageList=arduino/languageList=posix, posixmt, java, javascript/' config.properties

echo "> mv classicBalancer.properties loadBalancer.properties"
mv classicBalancer.properties loadBalancer.properties
=======
echo "sed -i 's/languageList=.*/languageList=posix, posixmt, java, nodejs/g' config.properties"
sed -i 's/languageList=.*/languageList=posix, posixmt, java, nodejs/g' config.properties

echo "> cp classicBalancer.properties loadBalancer.properties"
cp classicBalancer.properties loadBalancer.properties
>>>>>>> 3d71e209742b540415219c065820f0e23fa6893a

echo "> java -cp .:target/testJar-0.7.0-SNAPSHOT-jar-with-dependencies.jar org.thingml.loadbalancer.LoadBalancer"
java -cp .:target/testJar-0.7.0-SNAPSHOT-jar-with-dependencies.jar org.thingml.loadbalancer.LoadBalancer

echo "> ./dispatch.sh"
./dispatch.sh

echo "> DONE"


