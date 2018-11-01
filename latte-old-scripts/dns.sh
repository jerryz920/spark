docker-machine scp hdfs-1:/etc/hosts hdfs-hosts
cat spark-hosts >> hdfs-hosts
echo "192.2.0.7 metadata" >> hdfs-hosts
eval $(docker-machine env spark-1)
docker-machine scp hdfs-hosts spark-1:
docker-machine ssh spark-1 docker cp hdfs-hosts master:/
docker exec -it master bash -c "cat /hdfs-hosts >> /etc/hosts"


for n in `seq 2 10`; do
eval $(docker-machine env spark-$n)
docker-machine scp hdfs-hosts spark-$n:
docker-machine ssh spark-$n docker cp hdfs-hosts slave$n:/
docker exec -it slave$n bash -c "cat /hdfs-hosts >> /etc/hosts"
done
