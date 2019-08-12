require 'rails_helper'

RSpec.describe Cart, :type => :model do
  subject { described_class.new(user_id: 1)} 

  describe "Associations" do

    it "belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it "has many cart_itmes" do
      assc = described_class.reflect_on_association(:cart_items)
      expect(assc.macro).to eq :has_many
    end
  end
end