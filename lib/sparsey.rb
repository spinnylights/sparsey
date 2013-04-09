require 'sinatra/base'

class Sparsey < Sinatra::Base
  set :root, File.expand_path('../../', __FILE__)

  get '/' do
    erb :index
  end
end
