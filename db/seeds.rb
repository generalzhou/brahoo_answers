require 'faker'

class Factory

  def self.question_title
    Faker::Lorem.sentence
  end

  def self.question_text
  	Faker::Lorem.paragraph(2)
  end

  def self.answer(username)
  	Faker::Lorem.paragraph(2)
  end

  def self.comment
  	Faker::Lorem.sentence
  end

  def self.username
  	Faker::Name.name
  end

  def self.tags
  	Faker::Lorem.word
  end
end


###
# Make Users
###

usernames = ["Mitch", "Jack", "Henry"]
usernames.each do |username|
  User.create(username: username,
              email:    username.downcase+"@gmail.com",
              password: "password" )
end

12.times do
  User.create(username: Factory.username,
              email:    Factory.username.downcase+"@gmail.com",
              password: "password" )
end

users = User.all


###
# Make Questions
###

30.times do
  Question.create(title: Factory.question_title,
                  text:  Factory.question_text,
                  user:  users.sample)
end


###
# Make Answers
###

60.times do
  question = Question.all.sample
  Answer.create(question_id: question.id,
                user_id:     users.sample.id,
                text:        Factory.answer(question.user.username))
end

commentable = Answer.all + Question.all


###
# Make Comments
###

180.times do
  Comment.create(text: Factory.comment,
                 user_id: users.sample.id)
end

comments = Comment.all


###
# Make Tags
###

tags = Factory.tags.map { |name| Tag.create(name: name) }


###
# Add Comments
###

comments.each do |comment|
  commentable.sample.comments << comment
end


###
# Add Tags
###

Question.all.each do |question|
  tags.sample(rand(1..3)).each { |tag| question.tags << tag }
end