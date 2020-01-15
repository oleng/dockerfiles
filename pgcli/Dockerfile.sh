FROM python:3.8.1-slim-buster
MAINTAINER based on pgcli-docker by Dennis Coldwell <dennis.coldwell@gmail.com>

RUN apt-get -y update \
    && apt-get -y --no-install-recommends \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*
RUN set -eux; \
    && pip install -v --no-cache-dir pgcli

ADD run-pgcli.sh /bin/run-pgcli.sh
ENTRYPOINT ["run-pgcli.sh"]