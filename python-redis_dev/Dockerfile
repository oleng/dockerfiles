#--> base redis
# https://raw.githubusercontent.com/docker-library/redis/b6d413ceff3a2bca10a430ace121597fa8fe2a2c/6.0-rc/Dockerfile
FROM redis:6.0-rc1-buster AS redis
RUN	set -eux; \
	redis-cli --version; \
	redis-server --version


#--> base python
# https://raw.githubusercontent.com/docker-library/python/32b69d61f6cb2c8774be8099380cd37c699dfedf/3.8/buster/slim/Dockerfile
FROM python:3.8.1-slim-buster AS base

ENV GOSU_VERSION 1.11
ENV REDIS_VERSION 6.0-rc1

# grab gosu for easy step-down from root
# https://github.com/tianon/gosu/releases
COPY --from=redis /usr/local/bin/gosu /usr/local/bin/gosu
# grab redis binaries
COPY --from=redis /usr/local/bin/redis-benchmark /usr/local/bin/redis-benchmark
COPY --from=redis /usr/local/bin/redis-cli /usr/local/bin/redis-cli
COPY --from=redis /usr/local/bin/redis-server /usr/local/bin/redis-server
# entrypoint script
COPY --from=redis /usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r -g 999 redis && useradd -r -g redis -u 999 redis \
	&& ln -s /usr/local/bin/redis-server /usr/local/bin/redis-check-rdb \
	&& ln -s /usr/local/bin/redis-server /usr/local/bin/redis-check-aof \
	&& chown redis:redis /usr/local/bin/redis* \
	&& gosu nobody true \
	&& mkdir /data \
	&& chown redis:redis /data \
	&& pip install -v redis \
    && pip install -v hiredis


#--> final image
FROM base

ENTRYPOINT ["docker-entrypoint.sh"]
VOLUME /data
WORKDIR /data
EXPOSE 6379

CMD ["redis-server"]