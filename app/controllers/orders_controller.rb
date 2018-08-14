class OrdersController < ApplicationController

  get '/orders' do
    if logged_in?
      if admin?
        erb :'orders/index'
      else
        redirect '/show'
      end
    else
      redirect '/login'
    end
  end

  get '/orders/new' do
    if logged_in?
      if admin?
        erb :'orders/new'
      else
        redirect 'show'
      end
    else
      redirect 'login'
    end
  end

  post '/orders' do
    @order = Order.create(params[:order])
    redirect "/orders/#{@order.id}"
  end

  get '/orders/:id' do
    if logged_in?
      @order = Order.find_by_id(params[:id])
      if @order.user == current_user || admin?
        erb :'orders/show'
      else
        redirect '/show'
      end
    else
      redirect '/login'
    end
  end

end
