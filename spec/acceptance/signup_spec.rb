require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Signup", %q{
  In order to be a valid pair programmer
  As a site visitor
  I want to signup 
} do

  scenario "visit signup page" do
    visit signup
    page.should have_css("#user_email")
    page.should have_css("#user_city")
    page.should have_css("#user_name")
  end
end
