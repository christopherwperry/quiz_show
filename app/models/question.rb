class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :quiz

  validates_presence_of :body
end
