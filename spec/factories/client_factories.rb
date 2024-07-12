FactoryBot.define do
  factory :client do
    description { Faker::Name.name_with_middle }
    email { Faker::Internet.free_email }
    birth_date { Faker::Date.between(from:'1903-01-01', to: Date.today) }
  end
end