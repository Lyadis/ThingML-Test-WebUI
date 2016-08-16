FROM tutum/apache-php

RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
	sshpass

RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 32M/' /etc/php5/apache2/php.ini
RUN sed -i 's/post_max_size = 8M/post_max_size = 32M/' /etc/php5/apache2/php.ini

