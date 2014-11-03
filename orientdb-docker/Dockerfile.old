# orientdb
#
# VERSION: see `TAG`
# Using centos (yum)
FROM centos:centos7
MAINTAINER Gregg Hanold "ghanold79@gmail.com"

RUN yum -y update; yum clean all
RUN yum -y install httpd; yum clean all
EXPOSE 80

# Simple startup script to avoid some issues observed with container restart 
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
# install system deps
RUN yum -y install wget
RUN yum -y install tar
RUN yum -y install install java-1.7.0-openjdk-devel
RUN yum -y install git
RUN yum -y install ant

# install orientdb
ENV ROOT /opt/oseraf
ENV ORIENT_URL https://github.com/orientechnologies/orientdb.git

RUN mkdir ${ROOT} \
        && cd ${ROOT} \
	&& git clone ${ORIENT_URL} \
	&& cd orientdb \
	&& ant clean install \
	&& cd ..
ENV ORIENT_VERSION orientdb-community-2.0-M2
RUN mv ${ROOT}/orientdb ${ROOT}/${ORIENT_VERSION} \
        && ln -s ${ROOT}/releases/${ORIENT_VERSION} ${ROOT}/orientdb \
        && ln -s ${ROOT}/orientdb/bin/* /usr/local/bin/ \
        && mkdir /usr/local/log
RUN cd ${ROOT}/orientdb \
	&& rm -rf config \
	&& rm -rf databases

# cleanup
RUN yum clean all \
	&& rm -rf /opt/oseraf/linux /var/lib/apt/lists/* /tmp/* /var/tmp/*

# configure system
EXPOSE 2424
EXPOSE 2480
#CMD ["/usr/local/bin/server.sh"]
#
#CMD ["/run-httpd.sh"]

