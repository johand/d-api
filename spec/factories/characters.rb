# frozen_string_literal: true

FactoryBot.define do
  factory :character do
    image { Faker::LoremPixel.image }
    name { Faker::Internet.unique.username(specifier: 3..20) }
    age { Faker::Number.within(range: 1..100) }
    weight { Faker::Number.within(range: 1..100) }
    history { Faker::Lorem.sentence(word_count: 80) }

    association :user
  end
end
