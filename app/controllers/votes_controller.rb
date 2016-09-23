# Vote for question
post '/questions/:id/votes' do
  @question = Question.find(params[:id])
  @question.votes.create
  if request.xhr?
    @question.votes.count.to_json
  else
    redirect "/questions/#{@question.id}"
  end
end

# Vote for comment to question
post '/questions/:question_id/comment/:id/votes' do
  @question = Question.find(params[:question_id])
  @comment = @question.comments.find(params[:id])
  @comment.votes.create
redirect "/questions/#{@question.id}"
end

# Vote for answer
post '/questions/:question_id/answers/:id/votes' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  @answer.votes.create
  redirect "/questions/#{@question.id}"
end

# Vote for comment to answer
post '/questions/:question_id/answers/:answer_id/comments/:id/votes' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:answer_id])
  @comment = @answer.comments.find(params[:id])
  @comment.votes.create
redirect "/questions/#{@question.id}"
end

