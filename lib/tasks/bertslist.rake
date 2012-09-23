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
    Rake::Task["bertslist:bootstrap:pet_species"].invoke
  end

  namespace :bootstrap do
    
    #Create default pet_species
    task :pet_species => :environment do
      species = ["Dog", "Cat"]
      species.each do |s|
        PetSpecies.create({:name => s})
      end
    end

  end
          

end
