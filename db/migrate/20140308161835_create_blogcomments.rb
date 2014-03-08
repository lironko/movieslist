class CreateBlogcomments < ActiveRecord::Migration
  def change
    create_table :blogcomments do |t|
      t.text :content
      t.integer :user_id
      t.integer :blogpost_id

      t.timestamps
    end
    add_index :blogcomments, [:blogpost_id, :created_at]
  end
end
