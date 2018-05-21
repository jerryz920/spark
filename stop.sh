eval $(docker-machine env v1)
#docker run -dt --rm --name master sparkdev sbin/docker-start-master.sh
docker rm -f master
sleep 2
eval $(docker-machine env v2)
docker rm -f slave
#docker run -dt --rm --name slave sparkdev sbin/docker-start-slave.sh --master=spark://$master:7077
eval $(docker-machine env v3)
docker rm -f driver
