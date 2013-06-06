class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, :polymorphic => true
  
  attr_accessible :voteable_id, :voteable_type, :user_id
  validates_uniqueness_of :voteable_id, :scope => [:voteable_type, :user_id]
end
