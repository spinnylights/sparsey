$LOAD_PATH.unshift 'lib'

require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra'
require 'sass/plugin/rack'
require 'sparsey'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

run Sparsey
