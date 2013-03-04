namespace :bertslist do
  
  # use scripts/bootstrap instead
  # task :reset do
  #   if ENV["RAILS_ENV"]!= "production" #do not do this in production
  #     Rake::Task["db:drop"].invoke
  #     Rake::Task["db:create"].invoke
  #     Rake::Task["db:migrate"].invoke
  #     Rake::Task["bertslist:bootstrap"].invoke
  #     Rake::Task["bertslist:static:blog"]
  #   end
  # end

  # task :bootstrap do
  #   #Rake::Task["db:seed"].invoke
  # end

  namespace :static do
    desc "clear statics"
    task :clear do
      require 'fileutils'
      # FileUtils.rm_rf Dir.glob('./public/stylesheets/*.css')
      # FileUtils.rm_rf Dir.glob('./public/stylesheets/*/*.css')
      # FileUtils.rm_rf Dir.glob('./public/packages/*.gz')
      # FileUtils.rm_rf Dir.glob('./public/packages/*.css')
      # FileUtils.rm_rf Dir.glob('./public/packages/*.js')
      # FileUtils.rm_rf Dir.glob('./public/packages/*/*.gz')
      # FileUtils.rm_rf Dir.glob('./public/packages/*/*.css')
      Rake::Task["assets:clean"].invoke
      FileUtils.rm_rf Dir.glob('./public/blog')
    end


    desc "generates static assets"
    task :regen do
      Rake::Task["bertslist:static:clear"].invoke
      Rake::Task["bertslist:static:blog_layout"].invoke
    end

    desc "Blog layout"
    task :blog_layout => :environment do
      require 'erb'
      require 'stubs'

      av = ActionView::Base.new(Rails.root.join('app', 'views'))
      av.instance_eval do
        def get_binding
          binding
        end
      end
      av.assign({:blog => true})

      Dir.chdir(File.dirname(__FILE__) +"/../../jekyll/_layouts")

      Dir.glob("*.html").each do |layout|
        puts "generating layout for #{layout}"
        File.open(Dir.pwd+"/"+layout, 'w+') do |f|
          #f.write ERB.new(File.open(File.dirname(__FILE__) + "/../../app/views/layouts/application.html.erb", "rb").read).result(Layout.new.get_binding  { |*pages| '{{ content }}' if pages.empty? })
          f.write ERB.new(File.open(File.dirname(__FILE__) + "/../../app/views/layouts/blog.html.erb", "rb").read).result(av.get_binding  { |*pages| '{{ content }}' if pages.empty? })
        end
      end
    end

    desc "Generate the blog"
    task :blog do
      Rake::Task["bertslist:static:regen"].invoke
      require 'fileutils'
      FileUtils.rm_rf './public/blog'
      Dir.chdir(File.dirname(__FILE__) + "/../../jekyll") do
        exec('jekyll') 
      end       
    end
  end


          

end
