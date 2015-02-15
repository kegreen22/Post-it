class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	has_many :votes, as: :voteable

	validates :body, presence: true

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