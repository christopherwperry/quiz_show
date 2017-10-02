class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.integer :weight, default: 1
      t.string :type
      t.belongs_to :quiz, foreign_key: true

      t.timestamps
    end
  end
end
