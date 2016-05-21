class User < ActiveRecord::Base
  has_secure_password

  before_create :add_profile

  enum role:  [:user, :admin]
  enum state: [:unverified, :approved]

  has_one :profile, dependent: :destroy

  validates :email, uniqueness: true
  validates_confirmation_of :password

  private

  def add_profile
    build_profile
  end
end
