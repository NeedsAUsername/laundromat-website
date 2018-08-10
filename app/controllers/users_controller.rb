class UsersController < ApplicationController


  get '/signup' do
    if logged_in?
      redirect '/show'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.create(params[:user])
    redirect '/login'
  end

  get '/login' do
    if logged_in?
      redirect '/show'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    
  end

  get '/show' do
    if logged_in?
      @user = current_user
      erb :'users/show'
    else
      redirect '/login'
    end
  end

end
