require 'spec_helper'
include ViewHelpers

describe "layout.erb", type: :feature do
  set_up_capybara

  before(:each) do
    visit '/'
  end

  it "has a header" do
    page.should have_selector('.//header/h1')
  end

  it "has a footer" do
    page.should have_selector('.//footer')
  end
end
