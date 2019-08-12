class CartItem < ApplicationRecord
  enum status: [:paid, :unpaid]
  validates :status, presence: true
  belongs_to :cart
  belongs_to :food_item
  belongs_to :order, required: false
end
