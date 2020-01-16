FROM pam79/php-fpm:v7.4.1
LABEL maintainer="Paapa Abdullah Morgan <paapaabdullahm@gmail.com>"

WORKDIR /src
VOLUME /src

ENTRYPOINT ["php"]
