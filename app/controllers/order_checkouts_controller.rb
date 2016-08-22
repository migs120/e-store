class OrderCheckoutsController < ApplicationController
  respond_to :html, :js
  
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
                                first_name: params[:order_checkout][:first_name] == '' ? current_order.order_checkouts.last.first_name : params[:order_checkout][:first_name] ,
                                last_name: params[:order_checkout][:last_name] == '' ? current_order.order_checkouts.last.last_name : params[:order_checkout][:last_name] ,
                                email: params[:order_checkout][:email] == '' ? current_order.order_checkouts.last.email : params[:order_checkout][:email] ,
                                phone: params[:order_checkout][:phone] == '' ? current_order.order_checkouts.last.phone : params[:order_checkout][:phone] ,
                                adress: params[:order_checkout][:adress] == '' ? current_order.order_checkouts.last.adress : params[:order_checkout][:adress] ,
                                city: params[:order_checkout][:city] == '' ? current_order.order_checkouts.last.city : params[:order_checkout][:city] ,
                                state: params[:order_checkout][:state] == '' ? current_order.order_checkouts.last.state : params[:order_checkout][:state] ,
                                zip: params[:order_checkout][:zip] == '' ? current_order.order_checkouts.last.zip : params[:order_checkout][:zip] ,
                                bill_name: params[:order_checkout][:bill_name] == '' ? current_order.order_checkouts.last.bill_name : params[:order_checkout][:bill_name] ,
                                bill_adress: params[:order_checkout][:bill_adress] == '' ? current_order.order_checkouts.last.bill_adress : params[:order_checkout][:bill_adress] ,
                                bill_city: params[:order_checkout][:bill_city] == '' ? current_order.order_checkouts.last.bill_city : params[:order_checkout][:bill_city] ,
                                bill_state: params[:order_checkout][:bill_state] == '' ? current_order.order_checkouts.last.bill_state : params[:order_checkout][:bill_state] ,
                                bill_zip: params[:order_checkout][:bill_zip] == '' ? current_order.order_checkouts.last.bill_zip : params[:order_checkout][:bill_zip] ,   
                                card_type: params[:order_checkout][:card_type],
                                card_expires_on: card_exp_date,
                                instructions: params[:order_checkout][:instructions]
                                )
  @order.ip_address = request.remote_ip
  if @order.save
    if @order.purchase
      @order.update_attributes(purchased_at: DateTime.now  )     
       current_order.order_items.each do |item|
         Item.find(item.item_id) do |itemIn|
           OrderCheckout.find(@order.id).checkout_paid_items.create(title: itemIn.title, name: itemIn.name, price:itemIn.price, body: itemIn.body)
          end
      end   
      clean_params
      current_order.order_items.destroy_all
      #render :action => "success"
      redirect_to thank_you_path
    else
      clean_params
      render :action => "failure"
    end
    else
      clean_params
      render :action => 'new'
    end
  end
  
  
  
  
  def pal_purchase
   # $params = params
    #$current_order = current_order 
    a = []
    b = []
    current_order.order_items.each do |item|
      a << item.id.to_s 
      b << Item.find(item.item_id).name
    end
    
    logger.debug puts "
                      debbuger
                      \n #{a.to_s}
                      \n #{b.to_s}
                      \n currnt_order-> #{current_order.inspect }
                      \n currnt_order.order_items-> \n #{current_order.order_items.inspect } 
                      \n currnt_order.subtotal-> #{current_order.subtotal }
                      
                      " 
               # exit
    
    
    if current_order.order_items.any? 
         @retun_values={
                      
                      item_id: a.to_s ,
                       item_name: b.to_s,
                       order_id: current_order.id,
                      # email: current_user.email,
                       #item_sub_category:@item.sub_category_id
                       }
            values = {
                      business: "migs432-facilitator@yahoo.com ",
                      cmd: "_xclick",
                      upload: 1,
                 
                    return: "#{request.base_url}/pal_return?user_id=#{@retun_values[:order_id]}&authenticity_token=#{form_authenticity_token}&pal_button=true&method=post",
                 
                   notify_url: "#{request.base_url}/pal_return?user_id=#{@retun_values[:order_id]}&authenticity_token=#{form_authenticity_token}&pal_button=true&method=post",
                   
                     amount: current_order.subtotal.to_s,#number_to_currency order_item.total_price,
                     item_name: b.to_s,
                     item_number: "1",
                     quantity: a.count.to_s,
                     shipping: "4.00"
                    
    }
       
         redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
      
     else
         flash[:error] = "There was an error saving the Category. Please try again."

     end
    
    
    
  end
  
  
  def pal_return
     $params = params
    OrderCheckout.create(instructions: params.to_s)
    clean_params
    
    redirect_to root_path
    
  end
  
  
  
  def purchases
    render "purchases"
  end
  
  def destroy
  @order_checkout = OrderCheckout.find(params[:id])
  @order_checkout.update_attributes(paid_shipped_n_done: true)

  end

    def update
  @order_checkout = OrderCheckout.find(params[:id])
  @order_checkout.update_attributes(paid_shipped_n_done: true)

  end
  
  def thank_you
  
  end
  

  private
  
  def clean_params
    $params = ''
    $current_order = ''
    
  end
  
  
  
end
