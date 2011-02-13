require 'spec_helper'

describe User do
  
  describe "ensure city capitalization" do 
      
    before(:each) do
      @user = Factory(:user, :city => "Boulder", :username => "crobbin", :email => "crobbin@poohcorner.com")
    end

    it "should have a downcased city" do
      @user.city.should == 'Boulder'
    end

  end

  describe "find login from email or username" do
     
    before(:each) do
      @user = Factory(:user, :username => "crobbin", :email => "crobbin@poohcorner.com")
    end

    it "should find a user by email" do
      User.send(:find_for_database_authentication, :login => 'crobbin@poohcorner.com').should == @user
    end

    it "should find a user by username" do
      User.send(:find_for_database_authentication, :login => 'crobbin').should == @user
    end

  end

  describe "find by city" do

    before(:each) do
      @u = Factory(:user, :city => "Boulder", :username => "crobbin", :email => "crobbin@poohcorner.com")
      @users = User.find_by_city('Boulder')
    end

    it "shoudl find the user" do
      @users.should == [@u]
    end

  end

  describe "avatar url" do

    before(:each) do
      @user = Factory(:user, :username => "crobbin", :email => "crobbin@poohcorner.com")
    end

    it "should have a gravatar url" do
      gid = Digest::MD5.hexdigest(@user.email.downcase)
      @user.avatar_url.should == "http://gravatar.com/avatar/#{gid}.png?s=48"
    end
       
  end
  
end
