module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end

  def signup
    "/users/sign_up"
  end

end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
