post '/questions/:id/answers' do
	@question = Question.find(params[:id])
  @question.answers.create(params[:answer])

  redirect "/questions/#{params[:id]}"
end

post '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:id])
  @answer_comment = @answer.comments.create(params[:comment])

  redirect "/questions/#{params[:question_id]}"
end
