require 'rubygems'

require 'rake/clean'
require 'rake/rdoctask'

require 'yard'

require 'rspec'
require 'rspec/core/rake_task'

require File.dirname(__FILE__) + "/lib/hash_access/version.rb"

task :default => [ :spec ]

CLEAN.include(%w[ pkg doc .yardoc ])

desc 'Run RSpec examples'
RSpec::Core::RakeTask.new :spec do |t|
  t.rspec_opts = "--colour --format documentation"
  t.pattern = 'spec/*.rb'
end

desc "Build the gem"
task :build do
  system "gem build hash-access.gemspec"
end

desc "Push the gem to rubygems.org"
task :push do
  system "gem push hash-access-#{HashAccess::VERSION}"
end

desc "Generate documentation"
YARD::Rake::YardocTask.new :doc do |t|
  t.files = %w[ README.md, LICENSE, lib/**/*.rb ]
  t.options = %w[ --title HashAccess ]
end

