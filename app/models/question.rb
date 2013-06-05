class Question < ActiveRecord::Base
  attr_accessible :title, :text, :best_answer_id

  belongs_to :user

  has_many :answers, :question_tags
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable
end
