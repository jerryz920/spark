#dev/make-distribution.sh --tgz --name safe-spark -Phadoop-2.7
#build/sbt -Phadoop-2.7 -DskipTests -Dscala-2.11 package
cp Dockerfile dist/
cp docker-start* dist/sbin/
cp latte-exec dist/
cd dist

#eval $(docker-machine env krb)
#docker build -t sparkdev:std .
#

for n in `seq 1 10`; do
eval $(docker-machine env spark-$n)
docker build -t spark:abac .
#docker tag sparkdev:std 10.10.1.40:5000/sparkdev:std
#docker pull sparkdev:std
done
#mv spark*.tgz docker
