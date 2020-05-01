# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { Faker::ProgrammingLanguage.name[0..29] }
    description { Faker::TvShows::GameOfThrones.quote }
    location { Faker::Games::ElderScrolls.city }
    start_time { Faker::Time.between(from: DateTime.now, to: '2099-09-18 12:30:59 -0700') }
    end_time { Faker::Time.between(from: start_time, to: '2099-09-18 12:30:59 -0700') }
    organizer_email { Faker::Internet.email }
    organizer_telegram { "@#{Faker::Internet.username}" }
    link { Faker::Internet.url }

    trait :approved do
      state { 'approved' }
    end

    trait :pending do
      state { 'pending' }
    end

    user

    factory :invalid_event do
      title { nil }
      description { Faker::TvShows::GameOfThrones.quote }
      location { Faker::Games::ElderScrolls.city }
      start_time { Faker::Time.between(from: DateTime.now - 1, to: '2099-09-18 12:30:59 -0700') }
      end_time { Faker::Time.between(from: DateTime.now - 1, to: '2099-09-18 12:30:59 -0700') }
      organizer_email { Faker::Internet.email }
      organizer_telegram { "@#{Faker::Internet.username}" }
      link { Faker::Internet.url }
      user
    end
  end
end
