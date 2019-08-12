require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new(password: "password", email: "john@doe.com",
                                first_name: "ajay",last_name: "pandit",
                                address: "indore", contact_no: "8898898989"
                                )} 

  describe "Validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a address" do
      subject.address = nil
      expect(subject).to_not be_valid
    end  
    
    it "is not valid without a contact_no" do
      subject.contact_no = nil
      expect(subject).to_not be_valid
    end 
  end

  describe "Associations" do

    it "has one cart" do
      assc = described_class.reflect_on_association(:cart)
      expect(assc.macro).to eq :has_one
    end

    it "has many orders" do
      assc = described_class.reflect_on_association(:orders)
      expect(assc.macro).to eq :has_many
    end

    it "has many invoices" do
      assc = described_class.reflect_on_association(:invoices)
      expect(assc.macro).to eq :has_many
    end

    it "has many subscriptions" do
      assc = described_class.reflect_on_association(:subscriptions)
      expect(assc.macro).to eq :has_many
    end
  end
end