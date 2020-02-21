
Based on [sphinxdoc/sphinx:latest](https://github.com/drillan/sphinx-docker/blob/master/base/Dockerfile) (Python:slim)
- Pillow

Added
- libyaml

Python packages:

- jinja2
- Pygments
- pyparsing
- PyYAML
- rstcheck
- six
- sphinx
- sphinx-notfound-page
- straight.plugin

are installed for generating [ansible's docsite files](https://github.com/ansible/ansible/tree/stable-2.9)

For usage: https://www.sphinx-doc.org/en/master/usage/quickstart.html#running-the-build