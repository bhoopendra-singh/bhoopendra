class Category < ApplicationRecord
	validates :name, presence: true
	has_many :food_items
end
