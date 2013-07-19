class Question < ActiveRecord::Base
  attr_accessible :title, :text, :user, :best_answer_id, :tags, :tag_ids

  belongs_to :user

  has_many :answers
  has_many :question_tags
  has_many :tags, :through => :question_tags
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  belongs_to :best_answer, :class_name => "Answer", :foreign_key => "best_answer_id"

  validates_presence_of :title
  validates_presence_of :user

  self.per_page = 10

end
