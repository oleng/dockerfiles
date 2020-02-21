FROM python:3.8.1-alpine3.11 AS base

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
    && pip -v --no-cache-dir install --python-version=$(PYTHON_VERSION) \
        "psycopg2>=2.8.4" \
        "setproctitle==1.1.10" \
        "pgspecial>=1.11" \
        "six>=1.13" \
        "sqlparse>=0.3" \
    && apk --purge del .build-deps \
    && apk --purge del --no-network .fetch-deps

FROM base
ADD docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN set -ex \
    && addgroup -g 1000 -S postgres \
    && adduser -u 1000 -S postgres -G postgres \
    && chown -R postgres:postgres /bin/docker-entrypoint.sh \
    && chmod 755 /bin/docker-entrypoint.sh \
    && pip -v --no-cache-dir install --python-version=$(PYTHON_VERSION) \
        "humanize>=0.5" \
        "terminaltables>=3.1.0" \
        "tabulate>=0.8" \
        "wcwidth>=0.1.8" \
        "cli_helpers>=1.2" \
        "Pygments>=2.5" \
        "Click>=7" \
        "configobj>=5" \
        "prompt_toolkit>=3" \
        "pgcli>=2"

ENTRYPOINT ["docker-entrypoint.sh"]