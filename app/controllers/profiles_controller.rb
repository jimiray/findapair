class ProfilesController < ApplicationController

  def index
    # Add search here on a get param!
    conditions = params[:city].nil? ? {} : {:conditions => {:city => params[:city]}} 
    @profiles = Profile.paginate(:all, {}.merge(conditions), :page => params[:page])
    respond_to do |format|
      format.html {}
    end
  end

  def show
    @profile = Profile.find(params[:id])
    respond_to do |format|
      format.html {}
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    respond_to do |format|
      format.html {}
      format.xml {}
    end
  end

  def update
    @profile = Profile.find(params[:id])
    respond_to do |format|
      format.html { redirect_to(profile_path(@profile)) }
    end
  end

end
