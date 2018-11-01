#!/bin/bash

rm -f spark-hosts

eval $(docker-machine env spark-1)
docker run -dt --rm --hostname=spark-master --name master spark:std sbin/docker-start-master.sh
master=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' master`
echo "$master spark-master" >> spark-hosts

for n in `seq 2 10`; do
eval $(docker-machine env spark-$n)
docker run -dt --rm --hostname=spark-slave$n --name slave$n spark:std sbin/docker-start-slave.sh spark://$master:7077
slave=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' slave$n`
echo "$slave spark-slave$n" >> spark-hosts
done

