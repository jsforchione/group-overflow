get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/new' do 
  erb :'users/new'
end 

get '/users/:id' do
  redirect '/sessions/new' unless current_user
  redirect '/questions' unless session['user'] == params[:id].to_i
  erb :'/users/show'
end
