class UserResult < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer

  delegate :body, :correct, to: :answer, prefix: true
  delegate :body, to: :question, prefix: true
end
