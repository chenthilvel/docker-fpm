FROM centos:6
MAINTAINER ChenthilVel
RUN yum -y update && yum -y install rpm-build
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN curl -L get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh && /usr/local/rvm/bin/rvm requirements
RUN /usr/local/rvm/bin/rvm install 2.3.0
RUN bash -lc "rvm use --default 2.3.0 && rvm rubygems current && gem install fpm"
CMD ["/bin/bash"]
