class User < ActiveRecord::Base

  attr_accessible :username, :email, :password, :password_confirmation, :image
  mount_uploader :image, ImageUploader

  has_secure_password

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :email, :uniqueness => { :case_sensitive => false }, :format => /\w+@\w+\.\w{2,4}/

  validates :username, :uniqueness  => { :case_sensitive => false }, :length => {:minimum => 4}
  validates :password, :length => {:minimum => 6}

  validates_confirmation_of :password

end
