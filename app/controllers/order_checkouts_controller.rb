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
    li1 = "#{params[:order_checkout]['card_expires_on(1i)']}"
    li2 = "-#{params[:order_checkout]['card_expires_on(2i)']}"
    li3 = "-#{params[:order_checkout]['card_expires_on(3i)']}"
    card_exp_date = li1+li2+li3
  @order = OrderCheckout.create(Order_id: current_order.id,
                                first_name: params[:order_checkout][:first_name],
                                last_name: params[:order_checkout][:last_name],
                                email: params[:order_checkout][:email],
                                phone: params[:order_checkout][:phone],
                                adress: params[:order_checkout][:adress],
                                city: params[:order_checkout][:city],
                                state: params[:order_checkout][:state],
                                zip: params[:order_checkout][:zip],
                                bill_name: params[:order_checkout][:bill_name],
                                bill_adress: params[:order_checkout][:bill_adress],
                                bill_city: params[:order_checkout][:bill_city],
                                bill_state: params[:order_checkout][:bill_state],
                                bill_zip: params[:order_checkout][:bill_zip],    
                                card_type: params[:order_checkout][:card_type],
                                card_expires_on: card_exp_date,
                                instructions: params[:order_checkout][:instructions]
                                )
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
