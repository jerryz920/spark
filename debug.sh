#!/bin/bash


rm -f debug-hosts
eval $(docker-machine env spark-1)
docker run -dt --add-host "metadata:192.2.0.7" --security-opt seccomp:unconfined --rm --hostname=debug-master --name debug-master spark:abac sbin/docker-start-master.sh
master=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' debug-master`
echo "$master debug-master" >> debug-hosts

for n in `seq 2 10`; do
eval $(docker-machine env spark-$n)
docker run -dt --add-host "metadata:192.2.0.7" --rm --security-opt seccomp:unconfined --hostname=debug-slave$n --name debug-slave$n spark:abac sbin/docker-start-slave.sh spark://$master:7077
slave=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' debug-slave$n`
echo "$slave debug-slave$n" >> debug-hosts
done

