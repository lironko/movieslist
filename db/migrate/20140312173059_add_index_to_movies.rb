class AddIndexToMovies < ActiveRecord::Migration
  def change
  	    add_index :movies, :title
  	    add_index :movies, :imdb_id, unique: true
  end
end
