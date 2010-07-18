class Admin::SettingsController < Admin::ApplicationController
  def index
    render :action => :edit
  end
  
  def edit
  end
  
  def update
    @setting.update_attributes(params[:setting])
    flash[:notice] = "Settings saved"
    redirect_to :action => :index
  end
end