FROM openjdk:8-jre

ENV HADOOP_HOME=/hadoop-3.0.3
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin \
    HDFS_NAMENODE_USER=root \
    HDFS_DATANODE_USER=root \
    HDFS_SECONDARYNAMENODE_USER=root \
    YARN_RESOURCEMANAGER_USER=root \
    YARN_NODEMANAGER_USER=root

RUN apt-get update && \
    apt-get -y install openssh-server curl && \
    apt-get clean && \
    curl -O http://apache.cs.utah.edu/hadoop/common/hadoop-3.0.3/hadoop-3.0.3.tar.gz && \
    tar xzf hadoop-3.0.3.tar.gz && \
    mkdir /data && \
    ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    hdfs namenode -format

VOLUME ["/data"]
