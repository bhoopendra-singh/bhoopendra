class CartItemsController < ApplicationController

  def edit
    @cart_item = CartItem.find(params[:id])
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity])
    if@cart_item.save
      flash[:success] = "Your record updated Successfully."
      redirect_to  @cart_item.cart
    else
      render 'edit'
    end
  end

  def destroy
    @offer = Offer.find_by(id:params[:offer])
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    if @offer.present?
      respond_to do |format|
        format.js
      end
    else
      flash[:success] = "Your record deleted Successfully."
      redirect_to @cart_item.cart
    end
  end

  def delete_all
    cart_items = current_user.cart.cart_items
    if cart_items.destroy_all
      flash[:success] = "Your all items deleted Successfully."
      redirect_to menu_path
    end
  end
end
