require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Signup", %q{
  In order to see the sign out link
  As a signed in user
  I visit the home page 
} do

  include Warden::Test::Helpers 

  scenario "visit homepage after sign in" do
    login_as Factory.create(:user)
    visit homepage
    within('body') do
      page.should have_css('a#sign_out')
    end
  end

end
