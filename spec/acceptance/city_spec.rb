require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "City", %q{
  In order to find developers
  As a user 
  I want to lookup by city
} do

  scenario "visit city" do
    visit city_path('boulder')
    page.should have_css("#users")
  end
end
