############################################################
# Dockerfile to build ApacheSuperset Dashboards 
# Based on baseImage
############################################################

# Set the base image to ubuntu:trusty
FROM ubuntu:trusty

# File Author / Maintainer
MAINTAINER Marcio Godoi <souzagodoi@gmail.com>

USER root

# Superset version
ARG SUPERSET_VERSION=0.20.3

RUN apt-get update && \
    apt-get install -y \
