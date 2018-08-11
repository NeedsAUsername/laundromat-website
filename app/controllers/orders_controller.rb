class OrdersController < ApplicationController


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
end
