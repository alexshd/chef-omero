#
# Cookbook Name:: aol
# Recipe:: vim-tmux-zsh
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package %w( vim zsh git tmux httpie jq nmap )

directory '/root/.vim/bundle' do
  owner 'root'
  group 'root'
  recursive true
  mode '0755'
  action :create
end

git '/root/.vim/bundle/Vundle.vim' do
  repository 'https://github.com/gmarik/Vundle.vim.git'
  reference 'master'
  action :sync
end

git '/root/.oh-my-zsh' do
  repository 'https://github.com/robbyrussell/oh-my-zsh.git'
  reference 'master'
  action :sync
end

cookbook_file '/root/.zshrc' do
  source 'zshrc'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/root/.vimrc' do
  source 'vimrc'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/root/.tmux.conf' do
  source 'tmux.conf'
  owner 'root'
  group 'root'
  mode '0644'
end

bash 'vim_plugins' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  vim +PluginInstall +qall
  EOH
  not_if { ::File.exists?('/root/.vim/bundle/chef.vim/README') }
end

set_limit '*' do
  type 'hard'
  item 'nofile'
  value 65535
  use_system true
end

set_limit '*' do
  type 'soft'
  item 'nofile'
  value 65535
  use_system true
end