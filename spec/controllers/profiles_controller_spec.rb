require 'spec_helper'

describe ProfilesController do

   describe "on GET to index" do

     describe "without params" do

       before(:each) do
         (0...50).each do 
           create_profile
         end
         get :index
        end

        it { should assign_to(:profiles) }
        it { should render_template(:index) }
         
        it "should have 25 profiles" do
          assigns(:profiles).size.should == 25 
        end

      end

      describe "with city params" do
        
        before(:each) do
          @profile = create_profile
          get :index, :city => 'Boulder'
        end

        it { should assign_to(:profiles) }
        it { should render_template(:index) }

        it "should have 1 profile" do
          assigns(:profiles).first.should == @profile
        end

      end

   end

   describe "on GET to  show" do
     
     before(:each) do
       # create a fixjouir profile here.
       @profile =  create_profile
       get :show, :id => @profile.id
     end

     it { should assign_to(:profile) }
     it { should render_template(:show) }

   end

   describe "on GET to edit" do

     before(:each) do
        @profile = create_profile
        get :edit, :id => @profile.id
      end

      it { should assign_to(:profile) }
      it { should render_template(:edit) }

   end

   describe "on POST to update" do
     
     before(:each) do
       @profile = create_profile
       post :update, :id => @profile.id, :profile => {}
     end

     it { should assign_to(:profile) }
     it { should redirect_to(profile_path(@profile)) }

   end

end
