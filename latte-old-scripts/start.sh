eval $(docker-machine env v1)
docker run -dt --rm --name master sparkdev sbin/docker-start-master.sh
master=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' master`
echo Master is $master
sleep 2
eval $(docker-machine env v2)
docker run -dt --rm --name slave sparkdev sbin/docker-start-slave.sh spark://$master:7077
#eval $(docker-machine env v3)
#docker run -it --rm --name driver sparkdev bash
