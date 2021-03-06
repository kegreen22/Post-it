class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories 
	has_many :votes, as: :voteable

	validates :title, presence: true, length: {minimum: 5}
	validates :description, presence: true
	validates :url, presence:true, uniqueness: true

	before_save :generate_slug 

	def total_votes # determine the net votes to display
	up_votes - down_votes
	end
	 
	def up_votes
	self.votes.where(vote: true).size # use size to return a count
	end
	 
	def down_votes
	self.votes.where(vote: false).size
	end

	def to_param # to over-ride the regular to_param method
	self.slug
	end

	def generate_slug
		str = self.title
		str = str.strip
		str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
		str.gsub! /-+/, "-"
	  self.slug = str.downcase

	end


end