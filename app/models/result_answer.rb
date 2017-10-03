class ResultAnswer < ApplicationRecord
  belongs_to :result_quiz
  belongs_to :question
end
