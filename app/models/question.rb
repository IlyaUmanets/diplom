class Question < ActiveRecord::Base
  has_many :answers, dependent: :delete_all

  accepts_nested_attributes_for :answers
end
