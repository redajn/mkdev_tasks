# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { "qwe123" }
  end

  factory :another_user, class: User do
    email { Faker::Internet.unique.email }
    password { "qwe123" }
  end
end
