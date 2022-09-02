# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.user_name(specifier: 5..20) }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 8) }
  end
end
