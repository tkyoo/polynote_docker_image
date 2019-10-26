FROM ubuntu:18.04

RUN apt update

RUN apt -y install openjdk-8-jdk  python3-pip

RUN pip3 install pyspark==2.4.4

RUN apt -y install wget

RUN wget http://apache.mirror.cdnetworks.com/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz

RUN tar xzvf spark-2.4.4-bin-hadoop2.7.tgz && mv spark-2.4.4-bin-hadoop2.7 spark-2.4.4

RUN rm spark-2.4.4-bin-hadoop2.7.tgz

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ENV SPARK_HOME=/spark-2.4.4
ENV PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

RUN pip3 install jep jedi virtualenv numpy pandas

RUN wget https://github.com/polynote/polynote/releases/download/0.2.8/polynote-dist.tar.gz && tar xzvf polynote-dist.tar.gz && rm polynote-dist.tar.gz

ENV PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:/polynote:$PATH

ENTRYPOINT polynote
