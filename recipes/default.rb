#
# Cookbook:: go-counter-cookbook
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
#

# @afiune sadly since we need to use the toml gem inside habitat cookbook
chef_gem 'toml' do
  compile_time true
end

hab_install 'install habitat' do
  license 'accept'
end

# @afiune not yet supported for Chef Client version 12.X
#hab_sup 'default'
directory '/hab/sup/default' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

ruby_block 'hab_sup start' do
  block do
    `setsid hab sup run > /hab/sup/default/sup.log 2>&1`
  end
  not_if 'hab sup status'
  action :create
end

hab_package 'afiune/go-counter' do
  not_if 'hab svc status afiune/go-counter'
end
hab_service 'afiune/go-counter' do
  not_if 'hab svc status afiune/go-counter'
end

require_recipe 'go-counter-cookbook::lots_of_deprecations' if respond_to?(:require_recipe)
