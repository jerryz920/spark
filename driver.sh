






eval $(docker-machine env spark-1)
docker run --add-host "metadata:192.2.0.7" -it --rm --name driver spark:abac bash
