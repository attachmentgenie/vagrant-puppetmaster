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

task :inspec, [:node] do |t, args|
  if args[:node]
    nodes = [{'name' => args[:node]}]
  elsif vagrant_config['nodes']
    nodes = vagrant_config['nodes']
  else
    raise "Node definitions are missing."
  end

  nodes.each do |node|
    name = node["name"]
    puts
    if(File.directory?("test/#{name}"))
      puts "Profile found for node #{name}"
      sh("bundle exec inspec exec test/#{name} --sudo -t ssh://vagrant@127.0.0.1:$(vagrant port --guest 22 #{name}) -i #{vagrant_root}/.vagrant/machines/#{name}/virtualbox/private_key")
    else
      puts "No profile found for node #{name}"
    end
  end
end

