class UserMailer < ActionMailer::Base
    def forgot_password(params)
      from "system@domain.com"
      recipients params[:email]
      subject "Password Retrieval"
      body[:key] = params[:key]
    end
end