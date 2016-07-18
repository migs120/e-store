class OrderCheckoutsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def create
  #@order = current_cart.build_order(params[:order])
    $params = params
    $current_order = current_order
  @order = OrderCheckout.create(Order_id: current_order.id,
                                first_name: params[:order_checkout][:first_name],
                                last_name: params[:order_checkout][:last_name],
                                card_type: params[:order_checkout][:card_type],
                                card_expires_on: params[:order_checkout][:card_expires_on])
  @order.ip_address = request.remote_ip
  if @order.save
    if @order.purchase
      clean_params
      render :action => "success"
    else
      clean_params
      render :action => "failure"
    end
  else
    clean_params
    render :action => 'new'
  end
  end

  private
  
  def clean_params
    $params = ''
    $current_order = ''
  end
  
  
  
end
