require 'rubygems'
require 'bundler'
require 'obraspag'
Bundler.setup(:default, :test, :development)

require 'pry'

RSpec.configure do |config|
  config.mock_with :rspec
  config.filter_run_excluding :integration => true, :billet_integration => true
  config.run_all_when_everything_filtered = true
end
