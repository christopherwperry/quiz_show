class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :result_quizzes
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :total_points
end
