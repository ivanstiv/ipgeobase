require "bundler/gem_tasks"
#require "rspec/core/rake_task"
require 'rake/testtask'

#RSpec::Core::RakeTask.new(:spec)

#task :default => :spec
desc 'Run unit tests'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = true
end