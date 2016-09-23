class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	has_many :votes, as: :votable
	has_many :comments, as: :commentable
end
