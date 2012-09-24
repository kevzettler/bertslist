namespace :bertslist do
  
  task :reset do
    if ENV["RAILS_ENV"]!= "production" #do not do this in production
      Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      Rake::Task["db:migrate"].invoke
      Rake::Task["bertslist:bootstrap"].invoke
    end
  end

  task :bootstrap do
    Rake::Task["db:seed"].invoke
  end


          

end
