FactoryBot.define do
	factory :order do
	  user
	  ammount { Faker::Number.positive }
	  status { rand(0..1) }
	end
end