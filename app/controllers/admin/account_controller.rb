class Admin::AccountController < Admin::ApplicationController
  def index
    @admin = current_admin
  end
  
  def update
    current_admin.update_attributes(params[:admin])
    flash[:notice] = "Your account information has been saved"
    redirect_to :action => :index
  end
end