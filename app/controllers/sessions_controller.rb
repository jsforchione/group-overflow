get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else 
    @errors = ["Username or password did not match."]
    erb :'sessions/new'
  end
end

delete '/sessions/:id' do
  session[:user_id] = nil if session[:user_id]
  redirect '/questions'
end
