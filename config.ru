$LOAD_PATH.unshift 'lib'

require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra'
require 'sparsey'
run Sparsey
