class Plan < ApplicationRecord
	validates :plan_name, :price, :no_of_days, presence: true
	has_many :subscriptions
end
