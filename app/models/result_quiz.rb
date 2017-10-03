class ResultQuiz < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  has_many :result_answers
end
