FactoryBot.define do
	factory :food_item do
    photo { File.open(Rails.root.join('spec/support/JeeraRice.jpg')) }
    name { Faker::Name.name }
    price { Faker::Number.positive }
    description { Faker::Lorem.paragraph }
    category
	end
end