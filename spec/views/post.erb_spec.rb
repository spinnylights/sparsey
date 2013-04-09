require 'spec_helper'
include ViewHelpers

describe 'post.erb', type: :feature do
  set_up_capybara
  post_environment(post_title, post_date, post_content, post_slug)
  
  before(:each) { visit "/#{post_slug}" }

  describe 'its page' do
    it 'has only one post' do
      Capybara.match = :one

      page.should have_selector('.//article')
    end

    it 'has the post\'s content' do
      page.should have_text post_title, post_date, post_content
    end
  end
end
