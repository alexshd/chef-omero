# Description

Installs/Configures omero

# Requirements

## Platform:

*No platforms defined*

## Cookbooks:

* java
* python
* ark
* postgresql
* limits

# Attributes

* `node['java']['jdk_version']` -  Defaults to `8`.
* `node['java']['install_flavor']` -  Defaults to `oracle`.
* `node['java']['oracle']['accept_oracle_download_terms']` -  Defaults to `true`.

# Recipes

* omero::default
* omero::vim-tmux-zsh

# License and Maintainer

Maintainer:: The Authors (<you@example.com>)

License:: all_rights
