class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :user_id
    end

    add_index :questions, :title, unique: true
    add_index :questions, :description, unique: true
  end
end
