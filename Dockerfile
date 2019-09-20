FROM jenkins/jenkins:2.195-centos
LABEL maintainer="k2mani <k2mani@gmail.com>"

USER root

# install Node, wget, docker
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs wget docker

# install Development Tools
RUN yum group install -y "Development Tools"
RUN yum clean all -y

# install Grunt, node-gyp
RUN npm install -g grunt node-gyp

USER jenkins

WORKDIR /var/jenkins_home
