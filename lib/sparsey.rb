require 'sinatra/base'
require 'time'
require 'ostruct'
require 'psych'

class Sparsey < Sinatra::Base
  set :root, File.expand_path('../../', __FILE__)
  set :posts, []

  Dir.glob "#{root}/posts/*.md" do |file|
    meta, content = File.read(file).split("\n\n", 2)

    post         = OpenStruct.new(Psych.load(meta))
    post.date    = Time.parse post.date.to_s
    post.content = content
    post.slug    = File.basename(file, '.md')

    get "/#{post.slug}" do
      erb :post, locals: { post: post }
    end

    posts << post
  end

  get '/' do
    erb :index
  end
end
