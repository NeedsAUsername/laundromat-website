class RequestsController < ApplicationController

  get '/requests' do
    if admin?
      @requests = Request.all
      erb :'requests/index'
    else
      redirect '/'
    end
  end

  get '/requests/new' do
    if logged_in?
      @user = current_user
      erb :'requests/new'
    else
      redirect '/login'
    end
  end

  post '/requests' do
    # cannot use request as an instance variable. It is used by Sinatra.
    @user_request = Request.create(params[:request])
    @user_request.user = current_user
    @user_request.save

    redirect "/requests/#{@user_request.id}"
  end

  get '/requests/:id' do
    if logged_in?
      @user_request = Request.find(params[:id])
      if @user_request.user == current_user
        erb :'requests/show'
      else
        redirect '/show'
      end
    else
      redirect '/login'
    end
  end

  get '/requests/:id/edit' do
    if logged_in?
      @user_request = Request.find(params[:id])
      if @user_request.user == current_user
        erb :'requests/edit'
      else
        redirect '/show'
      end
    else
      redirect 'login'
    end
  end

  patch '/requests/:id/patch' do
    @user_request = Request.find(params[:id])
    @user_request.update(params[:request])
    @user_request.save
    redirect '/show'
  end

  delete '/requests/:id/delete' do
    @user_request = Request.find(params[:id])
    @user_request.delete

    redirect '/show'
  end


end
