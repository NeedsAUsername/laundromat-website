require './config/environment'

class ApplicationController < Sinatra::Base

  register Sinatra::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure do
    enable :sessions
    set :session_secret, "this_protects_users"
  end

  get '/' do
    if logged_in?
      redirect '/login'
    else
      erb :index
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def admin?
      !!current_user.admin
    end

    def ready?
      !!current_user.phone && !!current_user.address
    end

  end
end
