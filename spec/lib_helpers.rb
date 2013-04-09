module LibHelpers
  def generate_post_file
    require 'fileutils'

    before(:all) do
      # Temporarily moves existing post files out of posts/ for clean test env
      Dir.glob "#{Sparsey.root}/posts/*.md" do |file|
        FileUtils.mv(file, "#{Sparsey.root}/")
      end

      Sparsey.settings.reset!

      File.open("#{Sparsey.root}/posts/wag.md", 'w') do |file|
        file.write "title: Wag\n"
        file.write "date: 2013-04-09\n"
        file.write "\n"
        file.write "Wiggy wag wag wag whoosh."
      end

      load Sparsey.settings.app_file
    end

    after(:all) do
      File.delete("#{Sparsey.root}/posts/wag.md")

      Dir.glob "#{Sparsey.root}/*.md" do |file|
        FileUtils.mv(file, "#{Sparsey.root}/posts/")
      end

      load Sparsey.settings.app_file
    end
  end
end
