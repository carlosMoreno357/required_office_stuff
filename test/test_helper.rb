require 'simplecov'
require 'knapsack_pro'
knapsack_pro_adapter = KnapsackPro::Adapters::MinitestAdapter.bind
knapsack_pro_adapter.set_test_helper_path(__FILE__)

SimpleCov.start 'rails' do
  filters.clear # This will remove the :root_filter and :bundler_filter that come via simplecov's defaults
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/vendor/'
  add_filter '/jobs/'
  add_filter '/mailers/'
  add_filter '/channels/'
  add_filter '/helpers/'
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
end
SimpleCov.root("public")
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end