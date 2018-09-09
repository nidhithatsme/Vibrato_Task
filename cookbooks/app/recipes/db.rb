#
# Cookbook Name:: app
# Recipe:: db

mysql_service 'default' do
  version '8.5.1'
  action [:create, :start]
end

mysql_config 'hello' do
  instance 'default'
  source 'hello.conf.erb'
  version '8.5.1'
  action :create
end