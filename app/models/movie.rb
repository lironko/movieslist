class Movie < ActiveRecord::Base
	validates :year, :inclusion => 1900..2050
end
