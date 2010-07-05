class User < ActiveRecord::Base
#  attr_accessor :password, :password_confirmation, :active
  attr_accessor :password_confirmation

  validates_format_of :email,
    :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_uniqueness_of :email
  
  belongs_to :country
end