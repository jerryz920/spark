#!/bin/bash


eval $(docker-machine env spark-1)
docker logs debug-master

for n in `seq 2 10`; do
eval $(docker-machine env spark-$n)
docker logs debug-slave$n
done

