FROM pam79/php-fpm:v7.4.1
LABEL maintainer="Paapa Abdullah Morgan <paapaabdullahm@gmail.com>"

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

COPY docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]
CMD ["php"]
