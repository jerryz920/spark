docker-machine ssh krb rm -r spark-abac
docker-machine scp spark-2.1.3-SNAPSHOT-bin-safe-spark.tgz krb:
docker-machine ssh krb tar xf spark-2.1.3-SNAPSHOT-bin-safe-spark.tgz
docker-machine ssh krb mv spark-2.1.3-SNAPSHOT-bin-safe-spark spark-abac


