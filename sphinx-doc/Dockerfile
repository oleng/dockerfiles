FROM sphinxdoc/sphinx as base

CMD ['/bin/bash']
WORKDIR /docs

RUN set -eux \
    && apt-get update && apt-get install -y --no-install-recommends \
        dpkg-dev \
        gcc \
        autoconf \
        libtool \
        make \
        wget \

    && mkdir -p /usr/src/libyaml \
    && cd /usr/src/libyaml \
    && wget -O yaml-0.2.2.tar.gz http://pyyaml.org/download/libyaml/yaml-0.2.2.tar.gz \
    && tar -xv --strip-components=1 -f yaml-0.2.2.tar.gz \
    && ./configure && make && make install \
    && rm yaml-0.2.2.tar.gz \
    && python3 -m pip install -U \
        six \
        pyparsing \
        rstcheck \
        sphinx-notfound-page \
        jinja2 \
        Pygments \
        PyYAML \
        straight.plugin \
    && cd /docs \
    && apt-get clean \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/src/libyaml

