require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do

	let(:user){ FactoryBot.create(:user) }
  let(:cart){ FactoryBot.create(:cart, user_id: user.id) }
  let(:order){ FactoryBot.create(:order, user_id: user.id) }
  let(:category){ FactoryBot.create(:category) }
  let(:food_item){ FactoryBot.create(:food_item, category_id: category.id) }
  let(:cart_item1){ FactoryBot.create(:cart_item) }

	describe "PATCH udate for cart item" do
    let(:params){{cart_item: {quantity: 2}, id: cart_item1.id }}

    it "PATCH update" do
      patch :update, {params: params}
      expect(cart_item1.reload.quantity).to eql(params[:cart_item][:quantity])
    end
  end
  describe "DELETE destroy for cart item" do
    let(:params){{ id: cart_item1.id }} 
    it "DELETE destroy" do
      delete :destroy, {params: params}
      expect(CartItem.find_by(id: cart_item1.id)).to be_nil
    end
  end 
end