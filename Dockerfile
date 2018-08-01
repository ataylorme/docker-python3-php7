# Start with PHP 7.2
FROM drupalci/php-7.2-apache:production

# Update
RUN apt-get update

# Install wget
RUN \
	echo -e "\nInstalling wget..." && \
	apt-get install -y wget

# Install openssl
RUN \
	echo -e "\nInstalling openssl..." && \
	apt-get install -y openssl

# Install rsync
RUN \
	echo -e "\nInstalling rsync..." && \
	apt-get install -y rsync

# Install ssh
RUN \
	echo -e "\nInstalling ssh..." && \
	apt-get install -y openssh-client

# Install Terminus
RUN \
	echo -e "\nInstalling Terminus 1.x..." && \
	/usr/bin/env COMPOSER_BIN_DIR=$HOME/bin composer --working-dir=$HOME require pantheon-systems/terminus "^1"

# Enable Composer parallel downloads
RUN \
	echo -e "\nInstalling hirak/prestissimo for parallel Composer downloads..." && \
	composer global require -n "hirak/prestissimo:^0.3"

# Install Python
RUN apt-get install -y python3 python3-dev

# Install pip
RUN apt-get install -y python-pip

# Install virtualenv
RUN pip install virtualenv