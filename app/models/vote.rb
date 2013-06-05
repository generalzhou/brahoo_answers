class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, :polymorphic => true
  
  attr_accessible :voteable_id, :voteable_type
end
