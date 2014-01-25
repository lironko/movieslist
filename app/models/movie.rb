class Movie < ActiveRecord::Base
	belongs_to :user
	validates :year, :inclusion => 1900..2050
end
