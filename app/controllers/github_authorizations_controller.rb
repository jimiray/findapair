require 'net/http'

class GithubAuthorizationsController < ActionController::Base

  # Production
  #CLIENT_ID = "251a9f6bd7693f4d164d"
  #SECRET = "024a68288fd53f4f6d653e2288f4f43b040f9f6f"

  # Localhost:3000
  CLIENT_ID = "2ac9b4ea6799450528de"
  SECRET = "f6825189443730770c7a76d2ba8828e79206d68d"

  class Github
    include HTTParty

    base_uri 'http://github.com'
  end

  before_filter :authenticate_user!

  def new
   redirect_to "https://github.com/login/oauth/authorize?client_id=#{CLIENT_ID}&scopes=user,public_repo,repo,gist&redirect_uri=#{github_authorizations_url}"
  end

  def create
    resp = Github.post('/login/oauth/access_token', query: github_params(params[:code]))

    access_token = URI.decode_www_form(resp.body).assoc('access_token').last
    current_user.update_attribute(:github_token, access_token)
    render :text => resp.body
  end

  private

    def github_params(code)
      {
        client_id: CLIENT_ID,
        client_secret: SECRET,
        code: code
      }
    end

end
