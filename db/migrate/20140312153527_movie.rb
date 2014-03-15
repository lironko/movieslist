class Movie < ActiveRecord::Migration
  def change
  	create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :writer
      t.string :actors
      t.string :plot
      t.string :language
      t.string :country
      t.string :awards
      t.string :poster
      t.string :imdb_rating
      t.string :imdb_id
      t.string :type

      t.timestamps
	end
  end
end
