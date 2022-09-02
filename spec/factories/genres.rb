# frozen_string_literal: true

FactoryBot.define do
  factory :genre do
    name { Faker::Alphanumeric.unique.alphanumeric(number: 10) }
    image { Faker::LoremPixel.image }

    association :user
  end
end
