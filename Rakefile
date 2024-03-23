# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"
require "rubocop/rake_task"

Minitest::TestTask.create

desc "Run rubocop"
task :rubocop do
	RuboCop::RakeTask.new
end

task default: %i[test rubocop]
