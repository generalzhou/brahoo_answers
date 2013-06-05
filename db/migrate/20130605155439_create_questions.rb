class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string      :title, :null => false
      t.string      :text
      t.integer     :best_answer_id
      t.references  :user
      t.timestamps
    end
  end
end
