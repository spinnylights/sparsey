require 'sinatra/base'
require 'github_hook'
require 'time'
require 'ostruct'
require 'psych'

class Sparsey < Sinatra::Base
  use GithubHook

  set :root, File.expand_path('../../', __FILE__)
  set :posts, []
  set :app_file, __FILE__

  Post = Struct.new(:title, :date, :content, :slug)
  
  Dir.glob "#{root}/posts/*.md" do |file|
    meta, content = File.read(file).split("\n\n", 2)
    meta = Psych.load(meta)

    post = Post.new(meta['title'], 
                    Time.parse(meta['date'].to_s),
                    content,
                    File.basename(file, '.md'))

    get "/#{post.slug}" do
      erb :post, locals: { post: post }
    end

    posts << post
  end

  posts.sort_by! { |post| post.date }
  posts.reverse!

  get '/' do
    erb :index
  end
end
