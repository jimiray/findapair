class UsersController < ApplicationController

  def index
    if params[:city]
      @users = User.all(:conditions => { :city => params[:city] })
      render :layout => 'results'
    else
      flash[:error] = "You must provide a city"
      redirect_to root_path
    end
  end

  def show
    @user = User.find_by_username(params[:id])
    raise ActiveRecord::RecordNotFound unless @user
  end

end
