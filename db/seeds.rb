require 'faker'

100.times do |x|
  username = Faker::Superhero.name
  email = Faker::Internet.email
  password = 'password'
  User.create(username: username, email: email, password: password)
end

User.all.each do |user|
  title = Faker::Hipster.sentence
  text = Faker::Hipster.paragraph(1)
  user.questions.create(title: title, text: text)
end

Question.all.each do |question|
  text = Faker::Hipster.paragraph
  question.answers.create(text: text)

  3.times do |x|
    comment = Faker::Hipster.words(5)
    question.comments.create(text: comment)
  end
end

