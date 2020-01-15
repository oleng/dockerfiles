FROM python:3.8.1-alpine3.11

RUN set -ex \
    && apk add --no-cache --virtual .fetch-deps \
        postgresql-libs \
        libpq \
        libevent \
    && apk add --no-cache --virtual .build-deps \
        postgresql-dev \
        libevent-dev \
        musl-dev \
        gcc \
    && python -m ensurepip \
    && pip install --upgrade pip \
    && pg_config --version \
    && pip -v --no-cache-dir install psycopg2 \
    && pip -v --no-cache-dir install pgcli \
    && apk --purge del .build-deps

ADD entrypoint.sh /bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]