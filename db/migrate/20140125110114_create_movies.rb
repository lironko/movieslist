class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.integer :user_id

      t.timestamps
    end
  end
end
