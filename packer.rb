#!/usr/bin/env ruby

require 'json'
require 'pp'
require 'thor'
require 'yaml'

class PackerTasks < Thor
  desc "generate", "generate packer.json"
  option :builders, :type => :array, :required => true
  option :provisioners, :type => :array, :required => true
  option :'post-processors', :type => :array, :required => true
  option :output
  def generate()
    open(options[:output] || 'packer.json', 'w') do|f|
      f.puts JSON.pretty_generate([:builders, :provisioners, :'post-processors'].inject({}) {|template, type|
        template[type] = options[type].map {|option|
          begin
            YAML.load_file("packer/#{type}/#{option}.yaml")
          rescue => ex
            puts ex.message
          end
        }.compact
        template
      })
    end
  end
end

PackerTasks.start(ARGV)

