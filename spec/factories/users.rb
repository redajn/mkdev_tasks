# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    admin { false }

    factory :admin do
      email { Faker::Internet.unique.email }
      password { Faker::Internet.password }
      admin { true }
    end
  end
end
