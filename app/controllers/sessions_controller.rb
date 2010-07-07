class SessionsController < ApplicationController
  
  def new
  end

  def create
    logout_keeping_session!
    user = User.authenticate(params[:email], params[:password])
    if user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      if self.current_user.has_role?('admin')
        redirect_to '/admin'
      else
        redirect_back_or_default('/users/dashboard')
      end
      flash[:notice] = "Logged in successfully"
    else
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
  
  def forgot_password
    if request.post?
       @user_input = params[:user][:email]
      
       if @user_input && !@user_input.blank?
      
          @user = User.find_by_email(@user_input)
          
          unless @user.nil?
            @user.update_password_key = @user.encrypt(@user.email)
            @user.save
            email_params = {:from=> Role.find(:first, :conditions => ["name = 'admin'"]).users.first.email, :recipients => @user.email, :name => @user.login, :url => "#{request.protocol}#{request.host}#{request.port.to_s}/sessions/reset_password/#{@user.update_password_key}" }

            AdminMailer.deliver_send_email('Recover Password', email_params)
            flash.now[:notice] = "An email has been sent to: #{@user.email} to reset your password."
          else
            flash.now[:error] = "<b>#{@user_input}</b> is not a registered email address."
          end
       end # end params[:user][:email]
    end
  end
  
  def reset_password 
    @user = User.find_by_update_password_key(params[:id]) 
    if @user
      if request.post?
        if params[:user][:password] == params[:user][:password_confirmation]


          if @user.update_attributes(params[:user])

             logout_keeping_session!
             user = User.authenticate(@user.login, params[:user][:password])
             if user
               # Protects against session fixation attacks, causes request forgery
               # protection if user resubmits an earlier form using back
               # button. Uncomment if you understand the tradeoffs.
               # reset_session
               self.current_user = user
               new_cookie_flag = (params[:remember_me] == "1")
               handle_remember_cookie! new_cookie_flag
               redirect_back_or_default('/')
               flash.now[:notice] = "Logged in successfully"
             end
          else
            flash.now[:error] = "Something went while reseting your password"
          
          end

        else
          flash.now[:error] = "<b>Passwords Don't Match</b>"
        end
      end
    else
        render :file => "#{RAILS_ROOT}/public/404.html", :status => :not_found
    end
  end
  

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
