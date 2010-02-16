#
# Cookbook Name:: bootstrap-node
# Recipe:: default
#
# Copyright 2010, Hugo Duncan
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

user node[:orc][:user][:name] do
  password node[:orc][:user][:password]
  home "/home/#{node[:orc][:user][:name]}"
  supports :manage_home => true
  shell "/bin/bash"
end

node[:orc][:sudoers].each do |user|
  node[:authorization][:sudo][:users] << user
end

include_recipe "sudo"

directory "/home/#{node[:orc][:user][:name]}/" do
  owner node[:orc][:user][:name]
  group "users"
  mode "755"
end

directory "/home/#{node[:orc][:user][:name]}/.ssh" do
  owner node[:orc][:user][:name]
  group "users"
  mode "755"
end

template "/home/#{node[:orc][:user][:name]}/.ssh/authorized_keys" do
  source "authorized_keys.erb"
  owner node[:orc][:user][:name]
  group "users"
  mode "755"
end

