require 'rake'
require "rspec/core/rake_task"

task :default => :spec

desc "Run all test"
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  t.pattern = 'spec/**/*_spec.rb'
end


RSpec::Core::RakeTask.new('rcov') do |spec|
  spec.pattern = 'spec/*_spec.rb'
  spec.rcov = true
  spec.rcov_opts = ['--exclude-only', 'spec,gems,rubies']
end
