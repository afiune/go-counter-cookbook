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

hab_package 'afiune/go-counter' do
  not_if 'hab svc status afiune/go-counter'
end
hab_service 'afiune/go-counter' do
  not_if 'hab svc status afiune/go-counter'
end
