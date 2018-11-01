from ubuntu:xenial

RUN apt-get update && apt-get install -y git
RUN apt-get install -y curl build-essential default-jdk maven
COPY . /root/spark
COPY latte-exec /usr/bin/
WORKDIR /root/spark
ENV SPARK_HOME /root/spark
