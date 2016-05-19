class User < ActiveRecord::Base
  has_secure_password

  enum role:  [:user, :admin]
  enum state: [:unverified, :approved]

  validates :email, uniqueness: true
  validates_confirmation_of :password
end
