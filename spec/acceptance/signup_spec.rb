require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Signup", %q{
  In order to be a valid pair programmer
  As a site visitor
  I want to signup 
} do

  scenario "visit signup page" do
    visit signup_path
    page.should have_css("#user_email")
    page.should have_css("#user_city")
    page.should have_css("#user_name")
  end

  scenario "should signup" do
    visit signup_path
    within("#user_new") do
      fill_in "user_name", :with => "Christopher Robin"
      fill_in "user_email", :with => "crobin@findapair.me"
      fill_in "user_city", :with => "Boulder"
      fill_in "user_password", :with => "test1234"
      fill_in "user_password_confirmation", :with => "test1234"
      fill_in "user_twitter", :with => "testcrobin"
      fill_in "user_weapons", :with => "C, C++, Ruby, Ruby on Rails"
      lambda do
        click_link_or_button "Sign Up"
      end.should change(User, :count).by(1)
    end
  end

end
