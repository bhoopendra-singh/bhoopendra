class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_cart, :show]
  def add_to_cart
    cart = current_user.cart.present? ? current_user.cart : Cart.create(user_id: current_user.id)
    @cart_item = cart.cart_items.find_or_create_by(food_item_id: params[:cart_item][:food_item_id], status:"unpaid")
    @cart_item.update(quantity: params[:cart_item][:quantity])
    @offer = Offer.find_by(id: params[:cart_item][:offer_id])
    if @offer.present?
      redirect_to offer_path(@offer)
    else
      redirect_to menu_path
    end
  end
  
  def show
    @cart = Cart.find(params[:id])
    @unpaid_cart_items = @cart.cart_items.unpaid
    @offer = Offer.find_by(id: params[:offer_id])
  end
end
