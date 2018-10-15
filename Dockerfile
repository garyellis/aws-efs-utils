FROM centos:7
COPY efs-utils/build/amazon-efs-utils-1.5-1.el7.noarch.rpm /
RUN yum install -y /amazon-efs-utils-1.5-1.el7.noarch.rpm && \
    yum clean all
