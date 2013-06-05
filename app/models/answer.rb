class Answer < ActiveRecord::Base
  attr_accessible :text

  belongs_to :question, :user

  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable
end
