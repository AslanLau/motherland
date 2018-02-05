FROM php:7.0-cli

MAINTAINER You Ming <youming@funcuter.org>

COPY msgpack-2.0.2.tgz redis-3.1.4.tgz swoole-1.9.23.tgz xdebug-2.5.5.tgz /

RUN buildDeps="libssl-dev" \
    && apt-get update \
    && apt-get install -y --no-install-recommends supervisor $buildDeps \
    && docker-php-ext-install bcmath pdo_mysql shmop sysvmsg sysvsem sysvshm sockets \
    && pecl install msgpack-2.0.2.tgz redis-3.1.4.tgz swoole-1.9.23.tgz xdebug-2.5.5.tgz \
    && docker-php-ext-enable swoole msgpack redis \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -rf msgpack-2.0.2.tgz redis-3.1.4.tgz swoole-1.9.23.tgz xdebug-2.5.5.tgz \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["supervisord"]