module MoviesHelper

	def poster_for(movie)
   	  poster_url = movie.poster
   	  image_tag(poster_url, alt: movie.title, class: "poster")
	end

	def imdb_link_for(movie)
		imdb_id = movie.imdb_id
		imdb_link = "http://www.imdb.com/title/#{imdb_id}"
		link_to('IMDB', imdb_link)
	end

	def title_with_year_for(movie)
		title = movie.title
		year = movie.year
		"#{title} (#{year})"
	end
end
