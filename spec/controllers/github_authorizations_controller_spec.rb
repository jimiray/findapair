require 'spec_helper'

describe GithubAuthorizationsController do

  let(:client_id) { GithubAuthorizationsController::CLIENT_ID }
  let(:secret)    { GithubAuthorizationsController::SECRET }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  let(:user) { Factory(:user) }

  context "when I'm logged in" do
    before { sign_in user }

    describe "GET to new" do
      before { get :new }

      it { should redirect_to("https://github.com/login/oauth/authorize?client_id=#{client_id}&scopes=user,public_repo,repo,gist&redirect_uri=#{github_authorizations_url}") }
    end

    # redirected to from github
    describe "GET to create" do
      # mock/vcr for github - return github_access_token
      before do
        @api_request = stub_request(:post, "http://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{secret}&code=myvoiceismypassword").
                         to_return(:body => 'access_token=12345&token_type=bearer')
        get :create, :code => 'myvoiceismypassword'
      end

      it { user.reload.github_token.should == '12345' }
      it { @api_request.should have_been_requested }
      it "should render some view"
    end
  end

  context "when I'm not logged in" do
    describe "GET to new" do
      before { get :new }

      it { should redirect_to new_user_session_url }
    end
  end
end
