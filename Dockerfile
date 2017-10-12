############################################################
# Dockerfile to build ApacheSuperset Dashboards 
# Based on baseImage
############################################################

# Set the base image to ubuntu:trusty
FROM ubuntu:trusty

# File Author / Maintainer
MAINTAINER Marcio Godoi <souzagodoi@gmail.com>

USER root

RUN apt-get update && \
    apt-get install -y \
    wget \
   	tar \
	less \
	git \
	curl \
	vim \
	wget \
	unzip \
	netcat \
	software-properties-common \
	telnet

RUN wget https://sourceforge.net/projects/jasperserver/files/JasperServer/JasperReports%20Server%20Community%20Edition%206.4.0/TIB_js-jrs-cp_6.4.0_bin.zip -P /tmp/jasper

RUN unzip TIB_js-jrs-cp_6.4.0_bin.zip -d /tmp/jasper/

#1.7.0_151
RUN sudo apt-get install default-jdk

ENV JAVA_HOME=/usr/lib/jvm/default-java

ENV PATH=$PATH:/usr/lib/jvm/default-java/bin

RUN wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz -P /tmp/tomcat && \
  tar -xvzf /tmp/tomcat/apache-tomcat-7.0.82.tar.gz -C /tmp/tomcat && \
  mv /tmp/tomcat/apache-tomcat-7.0.82 /usr/local/tomcat && \
  rm -rf /tmp/tomcat

