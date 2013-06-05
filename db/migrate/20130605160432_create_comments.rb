class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.text :text
      t.references :user

      t.timestamps
    end
    add_index :comments, :user_id
  end
end
