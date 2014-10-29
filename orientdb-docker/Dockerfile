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

# install orientdb
ENV ROOT /opt/oseraf
ENV ORIENT_URL http://www.orientdb.org/portal/function/portal/download/unknown@unknown.com
ENV ORIENT_VERSION orientdb-community-1.7.9
RUN mkdir ${ROOT} \
	&& cd ${ROOT} \
	&& wget ${ORIENT_URL}/-/-/-/-/-/${ORIENT_VERSION}.tar.gz/false/false/linux \
	&& tar -xzf linux \
	&& ln -s ${ROOT}/${ORIENT_VERSION} ${ROOT}/orientdb \
	&& ln -s ${ROOT}/orientdb/bin/* /usr/local/bin/ \
	&& mkdir /usr/local/log

# cleanup
RUN yum clean all \
	&& rm -rf /opt/oseraf/linux /var/lib/apt/lists/* /tmp/* /var/tmp/*

# configure system
EXPOSE 2424
EXPOSE 2480
CMD ["/usr/local/bin/server.sh"]
#
CMD ["/run-httpd.sh"]
