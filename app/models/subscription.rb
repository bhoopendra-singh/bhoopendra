class Subscription < ApplicationRecord
	validates :expiry_date, presence: true
	belongs_to :plan
	belongs_to :user
	belongs_to :order
end
