require 'spec_helper'
include LibHelpers

describe 'Sparsey app' do
  include Rack::Test::Methods

  def app
    Sparsey.new
  end

  it 'has a homepage' do
    get '/'
    last_response.should be_ok
  end

  describe 'post file parsing' do
    generate_post_file

    it 'builds a post array' do
      Sparsey.posts.should_not be_empty
    end

    it 'has routes for posts' do
      get "/#{Sparsey.posts.first.slug}"
      last_response.should be_ok
    end
  end
end
