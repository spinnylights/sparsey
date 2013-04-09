require 'spec_helper'
include ViewHelpers

describe 'index.erb', type: :feature do
  set_up_capybara

  context 'without a post present' do
    clean_environment

    before(:each) { visit '/' }
    
    it 'has no posts' do
      page.should_not have_selector('.//article')
    end
  end

  context 'with a post present' do
    post_environment(post_title, post_date, post_content, post_slug)

    before(:each) { visit '/' }

    it 'displays posts' do
     page.should have_selector('.//article')
    end

    it 'has the right information' do
      page.should have_text(post_title, post_date, post_content)
    end
  end
end 
