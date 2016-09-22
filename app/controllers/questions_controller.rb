get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'questions/edit'
end

<<<<<<< HEAD
post '/questions' do
=======
put '/questions/:id' do
  p "*" * 80
  @question = Question.find(params[:id])
  @question.update(params[:question])
  redirect "/questions/#{@question.id}"
end

post '/questions' do 
>>>>>>> eaf9dff596ac5c96f7b82c2c7cda8ca71ce33a01
  @question = Question.new(params[:question])

  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = ["One or more fields are invalid"]
    erb :'questions/new'
    #erb with errors
  end

<<<<<<< HEAD
end
=======
end 

delete '/questions/:id' do 
  @question = Question.find(params[:id])
  @question.destroy
  redirect "/questions"
end





>>>>>>> eaf9dff596ac5c96f7b82c2c7cda8ca71ce33a01
