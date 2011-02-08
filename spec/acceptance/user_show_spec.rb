require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "User Show", %q{
  In order to view a user
  As a site visitor 
  I want to visit their home page
} do

  scenario "when I visit a non-existent user homepage" do
    assert_raises ActiveRecord::RecordNotFound do
      visit user_path("crobbin")
    end
  end

  scenario "when I visit the user homepage" do
    @user = Factory.create :user
    visit user_path(@user.username)
    page.should have_css(".user")
  end
end
