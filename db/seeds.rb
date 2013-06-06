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
  User.create(username: Faker::Internet.user_name,
              email:    Faker::Internet.email,
              password: "password" )
end

users = User.all


###
# Make Questions
###

30.times do
  Question.create(title: Faker::Company.name,
                  text:  Faker::Lorem.sentence,
                  user:  users.sample)
end


###
# Make Answers
###

60.times do
  Answer.create(question_id: Question.all.sample.id,
                user_id:     users.sample.id,
                text:        Faker::Company.catch_phrase)
end

commentable = Answer.all + Question.all


###
# Make Comments
###

180.times do
  Comment.create(text: Faker::Company.bs,
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
