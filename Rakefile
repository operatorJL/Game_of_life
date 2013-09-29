$:.unshift(File.join(File.dirname(__FILE__), 'src'))
require 'simplecov'
SimpleCov.start
SimpleCov.command_name 'unit tests'

require './src/run_game'
require 'rake'
require 'rake/testtask'

Rake::TestTask.new('run_game_tests') do |test|
  test.pattern = 'test/*_test.rb'
  test.verbose = true
  test.warning = true
end

task :run_game_of_life do
  ruby "src/run_game.rb"
end

task :default => :run_game_tests
task :run_game => :run_game_tests