module ApplicationHelper
  def custom_flash_message
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def food_item_quantity(food_item_id)
    cart_item = current_user.cart.cart_items.where(food_item_id: food_item_id).first
    if cart_item
      cart_item.quantity
    else
      0
    end
  end
  def calculate_amount
    @amount = 0
    current_user.cart.cart_items.unpaid.each do |cartitem|
      @amount = @amount + cartitem.food_item.price*cartitem.quantity
    end
    @amount
  end
end
