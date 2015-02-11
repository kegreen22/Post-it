class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories 

	validates :title, presence: true, length: {minimum: 5}
	validates :description, presence: true
	validates :url, presence:true, uniqueness: true

	def total_votes # determine the net votes to display
	up_votes - down_votes
	end
	 
	def up_votes
	self.votes.where(vote: true).size # use size to return a count
	end
	 
	def down_votes
	self.votes.where(vote: false).size
	end

	
end