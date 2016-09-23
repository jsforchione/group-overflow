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

  2.times do
    question.answers.create(text: text, user_id: User.all.sample.id)
  end

  3.times do |x|
    comment = Faker::Hipster.sentence(5)
    question.comments.create(text: comment, user_id: User.all.sample.id)
  end

  User.all.each do |user|
    random_comment = Comment.all.sample
    2.times do
      user.votes.create(votable_id: random_comment.id, votable_type: "Comment")
    end

    random_question = Question.all.sample
    3.times do
      user.votes.create(votable_id: random_question.id, votable_type: "Question")
    end

    random_answer = Answer.all.sample
    4.times do
      user.votes.create(votable_id: random_answer.id, votable_type: "Answer")
    end
  end
end

