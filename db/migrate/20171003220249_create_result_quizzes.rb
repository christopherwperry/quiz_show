class CreateResultQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :result_quizzes do |t|
      t.integer :points, default: nil
      t.belongs_to :user, foreign_key: true
      t.belongs_to :quiz, foreign_key: true

      t.timestamps
    end
  end
end
