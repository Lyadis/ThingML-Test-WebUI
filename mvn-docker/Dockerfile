# Add a git client to the base image

FROM maven:3.3.3-jdk-8
MAINTAINER Nicolas Harrand <nicolas.harrand@gmail.com>

# Add git client
RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
    curl \
    ca-certificates \
    git \
	nodejs \
	npm \
	openssh-server \
	gcc \
	make
RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
	sshpass

RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "alias node='nodejs'" >> /root/.bashrc

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
