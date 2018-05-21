#!/usr/bin/env rake
# encoding: utf-8
require 'yaml'

vagrant_root = File.expand_path(File.dirname(__FILE__))
if File.file?(vagrant_root + '/vagrant.yaml')
  vagrant_config = YAML.load_file(vagrant_root + '/vagrant.yaml')
elsif File.file?(vagrant_root + '/vagrant.yaml.dist')
  vagrant_config = YAML.load_file(vagrant_root + '/vagrant.yaml.dist')
else
  raise "No vagrant config is provided."
end

task default: %w[inspec]

task :inspec do
  if vagrant_config['nodes']
    vagrant_config['nodes'].each do |node|
      name = node["name"]
      if(File.directory?("test/#{name}"))
        puts "Profile found for node #{name}"
        sh("inspec exec test/#{name} -t ssh://vagrant@127.0.0.1:$(vagrant port --guest 22 #{name}) -i #{vagrant_root}/.vagrant/machines/#{name}/virtualbox/private_key")
      else
        puts "No profile found for node #{name}"
      end
    end
  else
    raise "Node definitions are missing."
  end
end
