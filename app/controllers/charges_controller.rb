class ChargesController < ApplicationController
  before_action :authenticate_user!
  layout 'application'
  def new
    offer = Offer.find_by(id:params[:offer])
    amount = params[:amount]
    if offer.present?
      @amount = amount
    else
      @amount = 0
      current_user.cart.cart_items.unpaid.each do |cartitem|
        @amount = @amount + cartitem.food_item.price * cartitem.quantity
      end
    end
  end
    
  def create
  # Amount in cents
  begin
    amount =  params[:payment][:amount]
    token = Stripe::Token.create( :card => { :number => params[:payment][:Card], :exp_month => params[:payment][:Expiry_month], :exp_year => params[:payment][:Expiry_year], :cvc =>  params[:payment][:security]})
    if !current_user.stripe_customer_id.present?
      customer = Stripe::Customer.create(:email => params[:email], :source  => token)
    end
    charge = Stripe::Charge.create(
      :amount => amount.to_i,
      :currency => "usd",
      :source => token.id, # obtained with Stripe.js
      :description => "Charge for jenny.rosen@example.com"
    )
    if charge.status.eql?('succeeded')
      order = Order.create(ammount: amount, user_id: current_user.id, status: "Paid")
      current_user.cart.cart_items.unpaid.update_all(order_id: order.id, status: "paid")
      order.create_invoice
      flash[:success] = "Payment successfully done..!"
      redirect_to menu_path
    else
      redirect_to new_charge_path
    end
    rescue Stripe::CardError, Stripe::InvalidRequestError,
         Stripe::AuthenticationError => e
      flash[:error] = e.message
      render 'new'
    end
  end

  def order_history
    @orders = current_user.orders
  end

  def subscription

  end

  def create_subscription
    plan =  Plan.find_by(id: params[:payment][:plan_id])
    begin

      if plan.present?
        stripe_plan_id = plan.stripe_plan_id
        price = plan.price
        if !current_user.stripe_customer_id
          token = Stripe::Token.create( :card => { :number => params[:payment][:Card], :exp_month => params[:payment][:Expiry_month], :exp_year => params[:payment][:Expiry_year], :cvc =>  params[:payment][:security]})
          customer = Stripe::Customer.create(:email => params[:email], :source  => token)
          current_user.update(stripe_customer_id: customer.id)
        end
        stripe_subscription = Stripe::Subscription.create(
                                                          :customer => current_user.stripe_customer_id,
                                                          :items => [{:plan => stripe_plan_id}]
                                                          )
        order = Order.create(ammount: price, status: "paid", user_id: current_user.id)
        subscription = Subscription.create(user_id: current_user.id, plan_id: plan.id, order_id: order.id, stripe_subscription_id: stripe_subscription.id, expiry_date: Time.now + plan.no_of_days.days)
        order.create_invoice
        flash[:success] = "Your one month subscription !current_user.stripe_customer_idcreated successfully."
        redirect_to menu_path
      end
    rescue
      flash[:error] = "Your subscription unsuccessfull try again.."
      redirect_to subscription_path
    end
  end
end
  