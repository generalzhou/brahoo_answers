class Answer < ActiveRecord::Base
  attr_accessible :text, :question

  belongs_to :question
  belongs_to :user

  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable

  validates_presence_of :text

end
