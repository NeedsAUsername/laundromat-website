class OrdersController < ApplicationController


  get '/orders/:id' do
    @order = Order.find_by_id(params[:id])
    erb :'orders/show'
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
