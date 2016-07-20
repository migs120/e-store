class OrderCheckout < ActiveRecord::Base
  belongs_to :order
  has_many :order_checkout_transactions, dependent: :destroy
  has_many :checkout_paid_items, dependent: :destroy
  attr_accessor :card_number, :card_verification
  validate :validate_card, :on => :create
  
  
  
  def purchase
    response = GATEWAY.purchase(
                                price_in_cents,
                                credit_card,
                                purchase_options
                              )
    
    
    order_checkout_transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
   # cart.update_attribute(:purchased_at, Time.now)  ## this needs to work but dont have a purchased_at attribute in any model
      if response.success?
    response.success?
      end
  end
  
  def price_in_cents
    ($current_order.subtotal*100).round 
  end

  private
  
  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => $params[:order_checkout][:bill_name],
        :address1 => $params[:order_checkout][:bill_adress],
        :city     => $params[:order_checkout][:bill_city],
        :state    => $params[:order_checkout][:bill_state],
        :country  => "US",
        :zip      => $params[:order_checkout][:bill_zip]
      }
    }
  end
  
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        #errors.add_to_base message
      end
    end
  end
  
  def credit_card

    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(

                first_name: $params[:order_checkout][:first_name],
                last_name:$params[:order_checkout][:last_name],
                number:$params[:order_checkout][:card_number],
                month: $params[:order_checkout]["card_expires_on(2i)"],
                year:$params[:order_checkout]["card_expires_on(1i)"],
                verification_value: $params[:order_checkout][:card_verification]
      
      
   )
  end
  
  
  
  
  
  
end
