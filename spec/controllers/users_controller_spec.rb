require 'spec_helper'

describe UsersController do

  describe "on GET to index" do

    describe "with city" do
      
      before(:each) do 
        @user = Factory.create(:user)
        get :index, :city => 'boulder'
      end

      it "should assign to users" do 
        assigns[:users].should == [@user]
      end

    end

  end

end
