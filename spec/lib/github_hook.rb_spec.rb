require 'spec_helper'
include LibHelpers

describe 'Github hook' do
  include Rack::Test::Methods

  def app
    Sparsey.new
  end

  describe 'parse_git method' do
    it 'creates a hash and a date' do
      GithubHook.parse_git
      GithubHook.commit_hash.should be_true
      GithubHook.commit_date.should be_true
    end
  end

  describe '/update' do
    specify 'caching' do
      post '/update'
      last_response['ETag'].should be_true
      last_response['Last-Modified'].should be_true
    end

    it 'is okay w/o autopull' do
      GithubHook.set(:autopull) { false }
      post '/update'
      last_response.should be_true
    end
  end
end
