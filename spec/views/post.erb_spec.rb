require 'spec_helper'

describe "posts", type: :feature do
  require 'capybara/dsl'
  include Capybara::DSL
  Capybara.app = Sparsey

  before do
    require 'ostruct'

    post = OpenStruct.new
    post.title   = "Wig Wag"
    post.date    = Time.parse "2013-04-09"
    post.content = "Wiggy waggy wag wag wag."

    Sparsey.posts << post
  end

  before(:each) do
    visit '/'
  end

  it "displays posts" do
   page.should have_selector('//article')
  end
end 
