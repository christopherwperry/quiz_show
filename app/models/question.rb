class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :result_answers
  belongs_to :quiz

  validates_presence_of :body
end
