class FilmCategory < ActiveRecord::Base
	has_and_belongs_to_many :films
end