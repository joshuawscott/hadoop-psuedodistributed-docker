FROM openjdk:8-jdk

ENV HADOOP_HOME=/hadoop-3.0.3
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:/apache-maven-3.6.0/bin \
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
    rm hadoop-3.0.3.tar.gz && \
    mkdir /data && \
    ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    hdfs namenode -format && \
    cd / && \
    curl -O http://apache.cs.utah.edu/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz && \
    tar xvzf apache-maven-3.6.0-bin.tar.gz && \
    rm apache-maven-3.6.0-bin.tar.gz && \
    git clone https://github.com/tomwhite/hadoop-book && \
    cd /hadoop-book && \
    mvn package -DskipTests

VOLUME ["/data"]
