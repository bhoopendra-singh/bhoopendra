class FoodItem < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :name,:price, presence: true
  belongs_to :category
  has_one :cart_item
  has_and_belongs_to_many :offers, dependent: :destroy
end
