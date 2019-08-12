require 'rails_helper'
require 'devise'

RSpec.describe CartsController, type: :controller do
  let(:user){ FactoryBot.create(:user) }
  let(:cart){ FactoryBot.create(:cart, user_id: user.id) }
  let(:order){ FactoryBot.create(:order, user_id: user.id) }
  let(:category){ FactoryBot.create(:category) }
  let(:food_item){ FactoryBot.create(:food_item, category_id: category.id) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe "POST add to cart" do
    let(:cart_item){ FactoryBot.create(:cart_item, cart_id: cart.id, food_item_id: food_item.id, order_id: order.id) }
    let(:params) {{ cart_item: {food_item_id: food_item.id, quantity: cart_item.quantity, cart_id: cart.id }}}
    
    it "POST add_to_cart" do
      post :add_to_cart, {params: params}
      expect(user.cart.cart_items.count).to eq(2)
    end
  end

  describe "GET show for unpaid cart items" do
    let!(:cart_item1){ FactoryBot.create(:cart_item, cart_id: cart.id, food_item_id: food_item.id, order_id: order.id, status: 1) }
    let!(:cart_item2){ FactoryBot.create(:cart_item, cart_id: cart.id, food_item_id: food_item.id, order_id: order.id, status: 0) }
    let(:params){ {id: cart.id}}
    it "GET show" do
      get :show, {params: params}
      expect(cart.cart_items.unpaid.last).to eql(cart_item1)
    end
  end  
end
