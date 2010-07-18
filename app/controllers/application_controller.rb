# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :init
  before_filter :check_recaptcha_for_devise, :only => :create

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
#  layout :layout_by_resource
  layout 'main'
  
  def layout_by_resource
    if devise_controller? and request.xhr?
      false
    else
      "main"
    end
  end

  
  private
  def init
    @setting = Setting.first
  end
  
  def check_recaptcha_for_devise
    # mark Devise Controllers to be excluded from verify_recaptcha
    except_devise_controllers = [:sessions, :passwords]

    # check if it's a devise_controller? and if marked for verify_recaptcha
    if devise_controller? && !except_devise_controllers.include?(controller_name.to_sym) and @setting

      # build the resource first and then check recaptcha challenge
      build_resource
      unless verify_recaptcha(:private_key => @setting.recaptcha_private_key)

        # if it fails add the error and render the form back to the client
        message = 'reCaptcha characters didn\'t match the word verification'
        resource.errors.add_to_base(message)
        render_with_scope :new
      end
    end
  end
end
