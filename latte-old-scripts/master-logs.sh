#!/bin/bash


eval $(docker-machine env spark-1)
docker logs master

