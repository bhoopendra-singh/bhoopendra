require 'rails_helper'
require 'devise'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user)
  end

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end
end