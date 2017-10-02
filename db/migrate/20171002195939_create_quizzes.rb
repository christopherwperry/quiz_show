class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.integer :total_points, null: false
      t.string :type
      t.boolean :published?, default: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
