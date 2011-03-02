require 'rubygems'
require 'rake/clean'
require 'rspec/core/rake_task'

task :default => [ :spec ]

CLEAN.include(%w[ pkg doc ])

desc 'Run RSpec examples'
RSpec::Core::RakeTask.new :spec do |t|
  t.rspec_opts = [ '--colour ', '--format documentation' ]
  t.pattern = 'spec/*.rb'
end

