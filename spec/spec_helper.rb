require 'rubygems'
require 'bundler'
Bundler.setup(:default, :test)
require 'sinatra'
require 'rspec'
require 'capybara/rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

require File.join(File.dirname(__FILE__), '../lib/sparsey')
require 'view_helpers'
require 'lib_helpers'

Capybara.default_selector = :xpath

Capybara.configure do |config|
  config.save_and_open_page_path = Dir.pwd+'/spec/save_page'
end
