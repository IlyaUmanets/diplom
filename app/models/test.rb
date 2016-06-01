class Test < ActiveRecord::Base
  belongs_to :user
  has_many :questions, dependent: :delete_all
  has_many :answers, through: :questions

  accepts_nested_attributes_for :questions
end
