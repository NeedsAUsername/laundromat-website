class RequestsController < ApplicationController

  get '/requests/new' do
    if logged_in?
      @user = current_user
      erb :'requests/new'
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

end
