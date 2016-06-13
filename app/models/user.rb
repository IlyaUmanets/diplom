class User < ActiveRecord::Base
  has_secure_password

  before_create :add_profile

  enum role:  [:user, :admin]
  enum state: [:unverified, :approved]

  has_one :profile, dependent: :destroy
  has_many :tests, dependent: :destroy
  has_many :user_tests, dependent: :destroy

  delegate :full_name, :faculty, to: :profile, prefix: true

  validates :email, uniqueness: true
  validates_confirmation_of :password

  def profile_name
    profile_full_name.present? ? profile_full_name : email
  end

  private

  def add_profile
    build_profile
  end
end
