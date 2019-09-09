FROM pam79/php-fpm
LABEL maintainer="Paapa Abdullah Morgan <paapaabdullahm@gmail.com>"

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

WORKDIR /src
VOLUME /src

ENTRYPOINT ["/bin/bash", "/tini", "--"]
CMD ["php"]
