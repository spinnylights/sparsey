require 'spec_helper'

describe "index.erb", type: :feature do
  require 'capybara/dsl'
  include Capybara::DSL
  Capybara.app = Sparsey

  before(:each) do
    visit '/'
  end

  it "has a header" do
    page.should have_selector('//header/h1')
  end
end
