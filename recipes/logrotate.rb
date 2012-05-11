#
# Author:: Morgan Nelson (<morgan@getaroom.com>)
# Cookbook Name:: chef-client
# Recipe:: logrotate
#
# Copyright 2012, getaroom
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

log_file = node["chef_client"]["log_file"].nil? ? "client.log" : node["chef_client"]["log_file"]
log_path = ::File.join(node["chef_client"]["log_dir"], log_file)

logrotate_app "chef-client" do
  cookbook "logrotate"
  path log_path
  frequency "daily"
  rotate 14
  create "644 rabbitmq rabbitmq"
end
