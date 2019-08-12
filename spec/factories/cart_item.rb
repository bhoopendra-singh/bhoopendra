FactoryBot.define do
	factory :cart_item do
		quantity { Faker::Number.digit }
		status { rand(0..1)}
	  food_item
	  cart
	  order
	end
end