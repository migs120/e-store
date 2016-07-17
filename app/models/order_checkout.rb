class OrderCheckout < ActiveRecord::Base
  belongs_to :order
  has_many :order_checkout_transactions
  attr_accessor :card_number, :card_verification
  validate :validate_card, :on => :create
    def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    order_checkout_transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
   # cart.update_attribute(:purchased_at, Time.now)  ## this needs to work but dont have a purchased_at attribute in any model
      if response.success?
    response.success?
      end
  end
  
  def price_in_cents
   # (cart.total_price*100).round
    Order.last.subtotal*100  ## this is hard coded and also needs to be modified to work
  end

  private
  
  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
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
      ##need this to work original rails cast set up but fails values are not passing from form to this controler corectly
      ##==================
     # :type               => card_type,
      #:number             => card_number,
      #:verification_value => card_verification,
      #:month              => card_expires_on.month,
      #:year               => card_expires_on.year,
      #:first_name         => first_name,
      #:last_name          => last_name
      
      ##remove this it works but its hard coded 
      ##============================
                :first_name         => 'Bob',
                :last_name          => 'Bobsen',
                :number             => '4032039537963375',
                :month              => '9',
                :year               => '2020',
                #:year               => '1890',
                :verification_value => '321'
   )
  end
  
  
  
  
  
  
end
