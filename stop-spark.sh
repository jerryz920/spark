#!/bin/bash


eval $(docker-machine env spark-1)
docker rm -f master

for n in `seq 2 10`; do
eval $(docker-machine env spark-$n)
docker rm -f slave$n 
done

