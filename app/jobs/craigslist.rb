require 'capybara'
require 'capybara/dsl'

# Capybara.current_driver = :selenium
# Capybara.app_host = 'http://www.craigslist.com'
# Capybara.run_server = false

module Craigslist
  include Capybara::DSL
  @queue = :bots

  def self.perform
    session = Capybara::Session.new(:selenium)
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
    session.execute_script "$('input:first').val('pet name')"
    session.execute_script "$('textarea').val('pet description')"
    session.click_on "Continue"
    session.execute_script ""
    session.click_on "Done with Images"
    session.click_button "Publish"
  end
end