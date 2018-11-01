#dev/make-distribution.sh --tgz --name safe-spark -Phadoop-2.7
#build/sbt -Phadoop-2.7 -DskipTests -Dscala-2.11 package

unset DOCKER_API_VERSION
unset DOCKER_CERT_PATH 
unset DOCKER_HOST      
unset DOCKER_MACHINE_NAME  
unset DOCKER_TLS_VERIFY

cp tmpdist/Dockerfile dist/
cp docker-start* dist/sbin/
cd dist
docker build -t sparkdev:std .
docker tag sparkdev:std 10.10.1.40:5000/sparkdev:std
docker push sparkdev:std


#for n in `seq 1 10`; do
#eval $(docker-machine env spark-$n)
#docker tag sparkdev:std 10.10.1.40:5000/sparkdev:std
#docker pull sparkdev:std
#done
#mv spark*.tgz docker
