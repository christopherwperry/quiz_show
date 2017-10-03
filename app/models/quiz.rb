class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :total_points
end
