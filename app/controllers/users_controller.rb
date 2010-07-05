class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    if user = User.create(params[:user])
      render :text => 'Signup successful.'
    else
      render :text => 'failed'
    end
  end
end
