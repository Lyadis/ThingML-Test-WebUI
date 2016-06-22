#Cloud

#Master node
##Main worker
 * ThingML git repo operations (pull)
 * Building (mvn)
 * Run org.thingml.testjar.loadBalancer.Main
 * Run dispatch.sh

##Host WebUI

#Slave node
##Worker
 * reiceives ssh call to pull tests data and run org.thingml.testjar.Main

##Host test sources, logs, etc

#Slave arduinode
##Worker
 * same thing but must have access to serial port

##Host test sources, logs, etc
