class Test < ActiveRecord::Base
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  has_many :user_tests, dependent: :destroy

  accepts_nested_attributes_for :questions
end
