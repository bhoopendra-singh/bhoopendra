FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Lorem.characters(8) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.city }
    contact_no { Faker::Base.numerify('+91(###) ### ####') }
  end
end