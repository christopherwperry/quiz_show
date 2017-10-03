class CreateResultAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :result_answers do |t|
      t.integer :points, default: nil
      t.belongs_to :result_quiz, foreign_key: true
      t.belongs_to :question, foreign_key: true

      t.timestamps
    end
  end
end
