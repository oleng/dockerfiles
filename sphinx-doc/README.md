
Based on [sphinxdoc/sphinx:latest](https://github.com/drillan/sphinx-docker/blob/master/base/Dockerfile) (Python:slim)
- Pillow

Added
- libyaml

The following Python packages were installed for generating `.html` files from [Ansible 2.9 documentation site's
source](https://github.com/ansible/ansible/tree/stable-2.9) in local machine ([see requirements](https://docs.ansible.com/ansible/latest/community/documentation_contributions.html#building-the-documentation-locally)]:

- jinja2
- Pygments
- pyparsing
- PyYAML
- rstcheck
- six
- sphinx
- sphinx-notfound-page
- straight.plugin


```
git clone -b stable-2.9 git@github.com:ansible/ansible.git
cd ansible/docs/docsite
mkdir html
docker --rm -v $(PWD):/docs oleng/sphinx-doc sphinx-build --color -av rst/ html/
```

For more sphinx usage instructions: https://www.sphinx-doc.org/en/master/usage/quickstart.html#running-the-build