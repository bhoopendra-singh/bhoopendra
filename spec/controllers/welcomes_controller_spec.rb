require 'rails_helper'
require 'stripe_mock'

RSpec.describe WelcomesController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user)
  end

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  it "should get index" do
    get :index
    expect(response.code.to_i).to eq(200)
  end

  describe "GET menu" do
    let(:category){create(:category)}
    let(:food_item){create(:food_item, category_id: category.id)}
    #before { StripeMock.start }
    #after { StripeMock.stop }
    it "get the menu" do
    get :menu
    end
  end
end