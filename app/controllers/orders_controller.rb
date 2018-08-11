class OrdersController < ApplicationController


  get '/orders/:id' do
    @order = Order.find_by_id(params[:id])
    erb :'orders/show'
  end
end
