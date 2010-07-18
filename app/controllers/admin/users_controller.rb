class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.paginate :page => params[:page]
  end
  
  def edit
    @user = User.find_by_id(params[:id])
  end
  
  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(params[:user])
    flash[:notice] = "User has been successfully updated"
    render :action => :edit
  end
  
  def deactivate
    @user = User.find_by_id(params[:id])
    @user.lock_access!
    flash[:notice] = "User has been deactivated"
    redirect_to :back
  end
end
