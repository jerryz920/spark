K8S=$GOPATH/src/k8s.io/kubernetes/
docker-machine scp spark-2.3.2-bin-2.7.3.tgz client:
docker-machine ssh client "rm -rf spark-2.3.2-bin-2.7.3; tar xf spark-2.3.2-bin-2.7.3.tgz; mkdir -p ~/.kube; sudo apt-get update -y; sudo apt-get install -y openjdk-8-jdk;"
cp $K8S/ydev/config-kuser1 tmpconfig
masterip=`docker-machine ssh master ifconfig | grep 192.1 | awk -F: '{print $2}' | awk '{print $1}'`
sed -i 's/server:.*/server: https:\/\/'$masterip'/' tmpconfig
docker-machine scp $K8S/ydev/config-kuser1 client:.kube/config

docker-machine ssh client 'chmod 600 ~/.kube/config; echo "export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.bashrc;'

