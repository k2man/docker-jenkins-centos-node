FROM jenkins/jenkins:2.235.3-centos7
LABEL maintainer="k2mani <k2mani@gmail.com>"

USER root

# install Node, wget, docker
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y nodejs wget docker-ce

# install Development Tools
RUN yum group install -y "Development Tools"
RUN yum clean all -y

# install Grunt, node-gyp
RUN npm install -g grunt node-gyp

WORKDIR /var/jenkins_home
