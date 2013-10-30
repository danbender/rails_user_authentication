class User < ActiveRecord::Base
  attr_accessible :email, :password
  validates :email, :presence => true
  validates_format_of :email, :with => /@/
  has_secure_password
end