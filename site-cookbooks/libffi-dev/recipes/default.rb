#
# Cookbook Name:: libffi-dev
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

package 'libffi-dev' do
    action :install
end
