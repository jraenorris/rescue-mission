class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer, null: false
      t.integer :question_id, null: false
      t.integer :user_id
    end
  end
end
