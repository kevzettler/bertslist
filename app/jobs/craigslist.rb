require 'capybara'
require 'capybara/dsl'

# Capybara.current_driver = :selenium
# Capybara.app_host = 'http://www.craigslist.com'
# Capybara.run_server = false

module Craigslist
  include Capybara::DSL
  @queue = :bots

  def self.perform(pet_id)
    pet = Pet.find pet_id
    session = Capybara::Session.new :selenium 
    session.visit 'https://accounts.craigslist.org/login'
    session.fill_in "inputEmailHandle", :with => "gcnicolet@yahoo.com"
    session.fill_in "inputPassword", :with => "bertslist"
    session.click_button "Log In"
    #TODO check for terms of service
    session.click_link "new posting"
    session.select "SF bay area", :from => "areaabb"
    session.click_on "go"
    session.choose "community" 
    session.choose "pets" 
    # how to pick area??
    session.choose "east bay area" 
    session.choose "oakland downtown" 
    session.execute_script "$('input:first').val('#{pet.name}')"
    session.execute_script "$('textarea').val('#{pet.description}')"
    session.click_on "Continue"
    pet.pet_images.each do |pi|
        #inject a script
        session.execute_script "var s = document.createElement('script');
                                s.type = 'text/javascript';
                                s.src = '#{pets_uploader_path(pet)}'
                                s.document.head.appendChild(s);
                                "
    end
    session.click_on "Done with Images"
    session.click_button "Publish"
  end
end