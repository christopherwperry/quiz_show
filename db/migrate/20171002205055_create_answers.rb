class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct?, default: false
      t.string :image_url
      t.belongs_to :question, foreign_key: true

      t.timestamps
    end
  end
end
