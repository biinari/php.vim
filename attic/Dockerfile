FROM ubuntu:24.04

LABEL maintainer="Bill Ruddock bill.ruddock@gmail.com"
LABEL maintainer.former="Stan Angeloff stanimir@psp-webtech.co.uk"

ENV UBUNTU_RELEASE=noble \
    ONDREJ_PHP_KEY="14AA40EC0831756756D7F66C4F4EA0AAE5267A6C"

RUN apt-get update && apt-get install -y gnupg2 && \
    /bin/echo -e "\n\ndeb http://ppa.launchpad.net/ondrej/php/ubuntu $UBUNTU_RELEASE main\ndeb-src http://ppa.launchpad.net/ondrej/php/ubuntu $UBUNTU_RELEASE main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$ONDREJ_PHP_KEY" && \
    apt-get update

COPY attic/install_extensions.sh /usr/local/bin/install_extensions

RUN chmod +x /usr/local/bin/install_extensions \
  && install_extensions 5.6 \
  && install_extensions 7.3 \
  && install_extensions 7.4 \
  && install_extensions 8.0 \
  && install_extensions 8.1 \
  && install_extensions 8.2 \
  && install_extensions 8.3 \
  ;

ADD attic/ /var/php

WORKDIR /var/php

CMD ["/bin/sh", "/var/php/update.sh"]
