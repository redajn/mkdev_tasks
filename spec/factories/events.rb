# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { Faker::ProgrammingLanguage.name }
    description { Faker::TvShows::GameOfThrones.quote }
    location { Faker::Games::ElderScrolls.city }
    start_time { Faker::Time.between(from: DateTime.now, to: "2099-09-18 12:30:59 -0700" ) }
    end_time { Faker::Time.between(from: start_time, to: "2099-09-18 12:30:59 -0700") }
    organizer_email { Faker::Internet.email }
    organizer_telegram { "@#{Faker::Internet.username}" }
    link { Faker::Internet.url }

    factory :invalid_event do
      title { nil }
      description { Faker::TvShows::GameOfThrones.quote }
      location { Faker::Games::ElderScrolls.city }
      start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      end_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
      organizer_email { Faker::Internet.email }
      organizer_telegram { "@#{Faker::Internet.username}" }
      link { Faker::Internet.url }
    end
  end
end

Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all)
