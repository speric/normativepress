class Book < ActiveRecord::Base
	has_many :posts

	def before_save
		self.slug = urlify(self.title)
	end
	
	def amazon_url
		"http://www.amazon.com/exec/obidos/ASIN/#{self.amazon_asin}/ref=nosim/prudedigit-20"
	end
end