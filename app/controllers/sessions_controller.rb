post '/sessions' do
  user = User.authenticate(params[:email])
  redirect "/sessions" unless user
  session["user"] = user.id
  redirect "/users/#{user.id}"
end

delete '/sessions' do
  sessions.delete(:user) if session[:user]
  redirect '/questions'
end

get '/sessions/new' do
  erb :'/sessions/new'
end