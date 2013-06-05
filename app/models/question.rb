class Question < ActiveRecord::Base
  attr_accessible :title, :text, :user, :best_answer_id

  belongs_to :user

  has_many :answers
  has_many :question_tags
  has_many :tags, :through => :question_tags
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable

  has_one :best_answer, :class_name => "Question", :foreign_key => "best_answer_id"

  validates_presence_of :title

end
