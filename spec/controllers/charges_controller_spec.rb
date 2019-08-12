require 'rails_helper'
require 'stripe_mock'
RSpec.describe ChargesController, type: :controller do
  # it "create customer" do
  #   customer = Stripe::Customer.create({email: 'johnny@appleseed.com', source: stripe_helper.generate_card_token})
  #   let(:user){create(:user, stripe_customer_id: customer.id)}
  # end
  let(:user){ FactoryBot.create(:user)}
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end
  describe "POST create" do
	  let!(:category){ FactoryBot.create(:category)}
    let!(:food_item){FactoryBot.create(:food_item, category_id: category.id)}
    let!(:cart){ FactoryBot.create(:cart, user_id: user.id) }
    let!(:order){ FactoryBot.create(:order, user_id: user.id) }
    let!(:cart_item){ FactoryBot.create(:cart_item, cart_id: cart.id, order_id: order.id, food_item_id: food_item.id) }
    let(:stripe_helper) { StripeMock.create_test_helper }
    before { StripeMock.start }
    after { StripeMock.stop }
    let(:params){{payment:{ Card: 4242424242424242, Expiry_year: 2020, Expiry_month: 04, security: 123, amount: 2200},email:'ram@gmail.com'}}
    it "generates a stripe card token and customer" do
      post :create, {params: params } 
    end 
  end

  describe "GET order history" do
    let!(:order){ FactoryBot.create(:order, user_id: user.id) }
    it "order history" do
      get :order_history
    end
  end

  describe "POST create subscription" do
    let(:stripe_helper) { StripeMock.create_test_helper }
    let(:stripe_plan){stripe_helper.create_plan(:id => 'my_plan', :amount => 1500)}
    let(:plan) { create(:plan, stripe_plan_id: stripe_plan.id)}
    let(:params){{payment:{ Card: 4242424242424242, Expiry_year: 2020, Expiry_month: 04, security: 123, amount: 2200,plan_id: plan.id},email:'ram@gmail.com'}}
    before { StripeMock.start }
    after { StripeMock.stop }
    it "create subscriotion" do
      customer = Stripe::Customer.create({email: 'johnny@appleseed.com', source: stripe_helper.generate_card_token})
      user.update(stripe_customer_id: customer.id)
      post :create_subscription, {params: params}
    end
  end

end