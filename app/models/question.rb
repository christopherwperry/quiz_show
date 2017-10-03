class Question < ApplicationRecord
  has_many :answers
  belongs_to :quiz

  validates_presence_of :body
end
