class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :trackable, :timeoutable, :lockable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :birthdate, :gender, :url_slug, :country_id, :province, :email, :password, :password_confirmation
  
end
