############################################################
# Dockerfile to build JasperReports Server 
# Based on ubuntu trusty image
############################################################

# Set the base image to ubuntu:trusty
FROM ubuntu:trusty

# File Author / Maintainer
MAINTAINER Marcio Godoi <souzagodoi@gmail.com>

#Setting up user as root 
USER root

#Installing Ubuntu packages
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
	telnet \
	default-jdk

#Setting the environment variables up used in this context
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV PATH=$PATH:/usr/lib/jvm/default-java/bin
ENV ENTRYPOINT_FOLDER=/opt/jasperreports/

#Download Apache Tomcat 7 - latest release used by Jasper Reports server
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz -P /tmp/tomcat && \
  tar -xvzf /tmp/tomcat/apache-tomcat-7.0.82.tar.gz -C /tmp/tomcat && \
  mv /tmp/tomcat/apache-tomcat-7.0.82 /usr/local/tomcat && \
  rm -rf /tmp/tomcat

#Download Jasper Reports distribution file, to extract .war file
RUN wget https://sourceforge.net/projects/jasperserver/files/JasperServer/JasperReports%20Server%20Community%20Edition%206.4.0/TIB_js-jrs-cp_6.4.0_bin.zip -P /tmp/jasper
RUN unzip /tmp/jasper/TIB_js-jrs-cp_6.4.0_bin.zip -d .

ADD mysql_master.properties /tmp/jasper/jasperreports-server-cp-6.4.0-bin/buildomatic/default_master.properties

# Put the entrypoint file into the JasperReports Server directory
ADD run.sh $ENTRYPOINT_FOLDER/entry-point.sh

# Allows the Entrypoint file to execute as a shell 
RUN chmod 755 $ENTRYPOINT_FOLDER/entry-point.sh

# Expose the connection port to the host
EXPOSE 8088

# Set the entrypoint file
ENTRYPOINT ["/opt/jasperreports/entry-point.sh"]