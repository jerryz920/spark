#!/bin/bash


eval $(docker-machine env spark-1)
docker rm -f debug-master

for n in `seq 2 10`; do
eval $(docker-machine env spark-$n)
docker rm -f debug-slave$n
done

