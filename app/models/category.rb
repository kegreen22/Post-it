class Category < ActiveRecord::Base
    has_many :post_categories
    has_many :posts, through: :post_categories
	
	validates :name, presence: true

	before_save :generate_slug

	def generate_slug
	  str = self.name
		str = str.strip
		str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
		str.gsub! /-+/, "-" 
	  self.slug = str.downcase 
	end

	def to_param
		self.slug
	end

end