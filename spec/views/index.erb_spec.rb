require 'spec_helper'

describe "index.erb", type: :feature do
  require 'capybara/dsl'
  include Capybara::DSL
  Capybara.app = Sparsey

  it "has a header" do
    visit '/'
    page.should have_selector('//header/h1')
  end
end
