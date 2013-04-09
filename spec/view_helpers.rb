module ViewHelpers
  def set_up_capybara
    require 'capybara/dsl'
    include Capybara::DSL
    Capybara.app = Sparsey
  end

  def clean_environment
    before(:each) do
      Sparsey.posts = []
    end
  end

  def post_environment(title, date, content, slug)
    before(:all) do
      require 'ostruct'

      post = OpenStruct.new
      post.title   = title
      post.date    = date
      post.content = content 
      post.slug    = slug

      Sparsey.get "/#{post.slug}" do
        erb :post, locals: { post: post }
      end

      Sparsey.posts << post
    end

    after(:all) do
      Sparsey.posts = []
    end
  end

  def post_title
    'Wag'
  end

  def post_date 
    '2013-04-09'
  end

  def post_content
    'Wiggy wag wag bag.'
  end

  def post_slug
    'wag'
  end
end
