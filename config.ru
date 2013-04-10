$LOAD_PATH.unshift 'lib'

require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra'
require 'sass/plugin/rack'
require 'sparsey'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

if ENV['URL'] and ENV['DATABASE_URL']
  # Heroku
  GithubHook.disable :autopull
elsif Sparsey.production?
  require 'rack/cache'
  use Rack::Cache
end

run Sparsey
