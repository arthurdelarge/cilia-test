FactoryBot.define do
  factory :product do
    description { Faker::Vehicle.make_and_model }
    long_description { Faker::Lorem.paragraph(sentence_count: 2, random_sentences_to_add: 4) }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end