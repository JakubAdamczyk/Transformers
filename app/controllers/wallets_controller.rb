class WalletsController < ApplicationController

  def new
   @credit = Wallets.new
 end

 def create
    # @credit = current_user.wallets.create(credit: true)

    credit_card = ActiveMerchant::Billing::CreditCard.new(
      :number     => (params[:number]),
      :month      => (params[:month]),
      :year       => (params[:year]),
      :first_name => (params[:first_name]),
      :last_name  => (params[:last_name]),
      :verification_value  => (params[:verification_value]),
      )

    if credit_card.valid?
  # Create a gateway object to the TrustCommerce service
  gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new(
    :login    => '9eqeV4WEr25J', #API Login ID
    :password => '99W484d37sW3d7PP' #Transaction Key
    )

  # Authorize for $10 dollars (1000 cents)
  response = gateway.authorize(1000, credit_card)

  if response.success?
    # Capture the money
    gateway.capture(1000, response.authorization)
    @credit = current_user.wallets.create(credit: true)
    flash[:notice] = "Mamy twoja kase ! hahaha"
    redirect_to roboto_index_path
  else
    flash[:alert] = "nie mamy twojej kasy, oddaj !"
    render :new
  end

else 
  flash[:alert] = "nie mamy twojej kasy, twoja karta jest slaba!"
    render :new

end


end

end
