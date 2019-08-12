FactoryBot.define do
	factory :plan do
      price {"500"}
      no_of_days {"30"}
      stripe_plan_id {"plan_EoMRjoepkV71Uy"}
      plan_name {Faker::Name.name}
	end
end