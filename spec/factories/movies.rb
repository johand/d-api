# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    image { Faker::LoremPixel.image }
    title { Faker::Movie.unique.title }
    date { Faker::Date.between(from: '1970-01-01', to: '2020-01-01') }
    qualification { Faker::Number.between(from: 1, to: 5) }

    association :user
  end
end
