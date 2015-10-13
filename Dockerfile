FROM centos:7

RUN yum update -y && yum -y install xmlstarlet saxon augeas bsdtar unzip wget && yum clean all && \
    yum remove java-1.6.0-openjdk && yum remove java-1.7.0-openjdk && \
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm" && \
    rpm -ivh jdk-8u60-linux-x64.rpm && \
    rm -f jdk-8u60-linux-x64.rpm

RUN groupadd -r jboss -g 1000 && useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss && \
    chmod 755 /opt/jboss

ENV JAVA_HOME /usr/java/jdk1.8.0_60/jre

WORKDIR /opt/jboss

USER jboss