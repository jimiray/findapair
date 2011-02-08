module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end

  def signup_path
    "/users/sign_up"
  end

  def user_path username
    "/~#{username}"
  end

end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
