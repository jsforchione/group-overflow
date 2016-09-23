post '/questions/:id/answers' do
	@question = Question.find(params[:id])
  @answer = @question.answers.create(params[:answer])
  if request.xhr?
  	erb :"partials/_answer_list", locals: {answer: @answer}, layout: false 
  else
	  redirect "/questions/#{params[:id]}"
	 end
end

post '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:id])
  @answer_comment = @answer.comments.create(params[:comment])

  redirect "/questions/#{params[:question_id]}"
end
