class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :user_results, dependent: :destroy

  accepts_nested_attributes_for :answers
end
