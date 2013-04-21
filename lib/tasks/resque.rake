require "resque/tasks"
Dir.glob("./app/jobs/*.rb").each { |f| require f }

task "resque:setup" => :environment