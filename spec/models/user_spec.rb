require 'spec_helper'

describe User do

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
end
