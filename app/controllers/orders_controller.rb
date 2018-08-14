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

  get '/orders/:id/edit' do
    if logged_in?
      if admin?
        @order = Order.find(params[:id])
        erb :'orders/edit'
      else
        redirect 'show'
      end
    else
      redirect 'login'
    end
  end

  post '/orders/:id' do
    @order = Order.find(params[:id])
    @order.update(params[:order])
    @order.save

    redirect '/orders'
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
