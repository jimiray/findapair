class UsersController < ActionController::Base

  def show
    @user = User.find_by_username(params[:id])
    raise ActiveRecord::RecordNotFound unless @user
  end

end
