require 'sinatra/base'
require 'time'

class GithubHook < Sinatra::Base
  def self.parse_git
    unless File.exists?('revalidation.txt')
      raise 'revalidation.txt does not exist. Please run push_heroku.'
    end
    sha1, date = IO.read('revalidation.txt').strip.split('^')
    set :commit_hash, sha1
    set :commit_date, Time.parse(date)
  end

  set(:autopull) { production? }
  parse_git

  before do
    cache_control :public, :must_revalidate
    etag settings.commit_hash
    last_modified settings.commit_date
  end

  post '/update' do
    settings.parse_git

    app.settings.reset!
    load app.settings.app_file

    content_type :txt
    if settings.autopull?
      `git pull 2>&1`
    else
      "ok"
    end
  end
end
