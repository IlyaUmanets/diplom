class UserTest < ActiveRecord::Base
  belongs_to :test
  belongs_to :user
  has_many :user_results, dependent: :destroy

  accepts_nested_attributes_for :user_results

  delegate :name, to: :test

  def correct_answers_count
    user_results.select(&:answer_correct).count
  end
end
