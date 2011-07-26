class Book < ActiveRecord::Base
	has_many :posts
end