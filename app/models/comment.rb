class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  attr_accessible :commentable_id, :commentable_type, :text
end
