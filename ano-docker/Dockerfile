FROM maven:3.3.3-jdk-8

MAINTAINER Nicolas Harrand <nicolas.harrand@gmail.com>

RUN rm -rf /var/lib/apt/lists/*
RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
	openssh-server \
    ca-certificates \
	gcc \
	make \
	wget \
	unzip \
	python \
	python-setuptools \
	sshpass \
	arduino \
	arduino-core \
	screen \
 && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://github.com/scottdarch/Arturo/archive/master.zip \
	&& unzip master.zip \
	&& mv Arturo-master Arturo \
	&& cd Arturo \
	&& make install

RUN mkdir /etc/avrdude
RUN cp /etc/avrdude.conf /etc/avrdude/

RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
