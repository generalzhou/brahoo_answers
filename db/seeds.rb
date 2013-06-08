require 'yaml'
BRO = YAML.load_file('db/bronouns.yml')

class Bro

  def self.question_title
    lead = ['Should', 'Can', "Will"].sample
    person = ['I', 'bros', 'you', 'my brosephs'].sample
    verb = BRO['verbs'].sample
    [lead,person,verb].join(' ') + '?'
  end

  def self.question_text
    lead = ['How', 'Where', 'What', 'When'].sample
    q = ['can','should', 'will','would'].sample
    verb = BRO['verbs'].sample
    adjective = BRO['brahjectives'].sample
    noun = (BRO['nouns'] + BRO['events']).sample
    [lead, q, 'I', verb, adjective, noun].join(' ') + '?'
  end

  def self.answer(username)
    greeting = BRO['greetings'].sample
    bronoun = [BRO['bronouns'].sample, username].sample
    brahverb = BRO['brahverbs'].sample
    "#{greeting.capitalize}, #{bronoun.downcase}. #{brahverb}"
  end

  def self.comment
    BRO['brahverbs'].sample
  end

  def self.username
    BRO['bronames'].sample.gsub(' ', '_')
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
  User.create(username: Bro.username,
              email:    Bro.username.downcase+"@gmail.com",
              password: "password" )
end

users = User.all


###
# Make Questions
###

30.times do
  Question.create(title: Bro.question_title,
                  text:  Bro.question_text,
                  user:  users.sample)
end


###
# Make Answers
###

60.times do
  question = Question.all.sample
  Answer.create(question_id: question.id,
                user_id:     users.sample.id,
                text:        Bro.answer(question.user.username))
end

commentable = Answer.all + Question.all


###
# Make Comments
###

180.times do
  Comment.create(text: Bro.comment,
                 user_id: users.sample.id)
end

comments = Comment.all


###
# Make Tags
###

tag_names = ["bro", "brah", "broheim", "brotastic", "bromeggedon", "wwbsd"]
tags = tag_names.map { |name| Tag.create(name: name) }


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