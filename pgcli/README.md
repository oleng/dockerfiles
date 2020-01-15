Made with stolen parts from `dencold/pgcli-docker` & `pygmy/alpine-tini:3.7`.
See https://stackoverflow.com/a/47871121 on alpine's packages for building `pg_config`.

- Based on `python:3.8.1-alpine3.11`, `pgcli 2.2.0`
- pip install flags & explicit package versions pinned to minimum requirements.
- Multistaged: install pgcli dependencies in base image for packages needing `gcc`:
    ```
    ## First stage: base build
    && pip -v --no-cache-dir install --python-version=$(PYTHON_VERSION) \
        "psycopg2>=2.8.4" \
        "setproctitle==1.1.10" \
        "pgspecial>=1.11" \
        "six>=1.13" \
        "sqlparse>=0.3" \

    FROM base
    ## last stage
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
    ```