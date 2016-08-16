#!/bin/bash
#Master node init
swarm-master
mainid=`docker run -v thingml:/thingml -p 44442:44442 -p 44444:22 -d lyadis/mvn-worker`
docker run -v thingml:/app -p 44443:80 -d lyadis/php

#ano workers
docker run -v thingmlino0:/thingml --device=/dev/ttyACM0 -p 44450:22 -d lyadis/ano
docker run -v thingmlino1:/thingml --device=/dev/ttyACM1 -p 44451:22 -d lyadis/ano
docker run -v thingmlino2:/thingml --device=/dev/ttyACM2 -p 44452:22 -d lyadis/ano
docker run -v thingmlino3:/thingml --device=/dev/ttyACM3 -p 44453:22 -d lyadis/ano
docker run -v thingmlino4:/thingml --device=/dev/ttyACM4 -p 44454:22 -d lyadis/ano
docker run -v thingmlino5:/thingml --device=/dev/ttyACM5 -p 44455:22 -d lyadis/ano

docker run -v thingmlino0:/app -p 44460:80 -d bitnami/apache
docker run -v thingmlino1:/app -p 44461:80 -d bitnami/apache
docker run -v thingmlino2:/app -p 44462:80 -d bitnami/apache
docker run -v thingmlino3:/app -p 44463:80 -d bitnami/apache
docker run -v thingmlino4:/app -p 44464:80 -d bitnami/apache
docker run -v thingmlino5:/app -p 44465:80 -d bitnami/apache

#mvn workers
maxcloudnode1
docker run -v thingml:/thingml -p 44444:22 -d lyadis/mvn-worker
maxcloudnode2
docker run -v thingml:/thingml -p 44444:22 -d lyadis/mvn-worker
maxcloudnode3
docker run -v thingml:/thingml -p 44444:22 -d lyadis/mvn-worker
maxcloudnode4
docker run -v thingml:/thingml -p 44444:22 -d lyadis/mvn-worker

minicloudnode1
docker run -v thingml:/thingml -p 44444:22 -d lyadis/mvn-worker
minicloudnode2
docker run -v thingml:/thingml -p 44444:22 -d lyadis/mvn-worker
minicloudnode3
docker run -v thingml:/thingml -p 44444:22 -d lyadis/mvn-worker
minicloudnode4
docker run -v thingml:/thingml -p 44444:22 -d lyadis/mvn-worker
minicloudnode5
docker run -v thingml:/thingml -p 44444:22 -d lyadis/mvn-worker
minicloudnode6
docker run -v thingml:/thingml -p 44444:22 -d lyadis/mvn-worker


#apache
maxcloudnode1
docker run -v thingml:/app -p 44443:80 -d bitnami/apache
maxcloudnode2
docker run -v thingml:/app -p 44443:80 -d bitnami/apache
maxcloudnode3
docker run -v thingml:/app -p 44443:80 -d bitnami/apache
maxcloudnode4
docker run -v thingml:/app -p 44443:80 -d bitnami/apache

minicloudnode1
docker run -v thingml:/app -p 44443:80 -d bitnami/apache
minicloudnode2
docker run -v thingml:/app -p 44443:80 -d bitnami/apache
minicloudnode3
docker run -v thingml:/app -p 44443:80 -d bitnami/apache
minicloudnode4
docker run -v thingml:/app -p 44443:80 -d bitnami/apache
minicloudnode5
docker run -v thingml:/app -p 44443:80 -d bitnami/apache
minicloudnode6
docker run -v thingml:/app -p 44443:80 -d bitnami/apache

#Start WS server
swarm-master
docker exec -d $mainid nodejs /thingml/serverWS/gen/main.js
