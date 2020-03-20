# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { "Anniversary event" }
    description { "Jast some event like u see early" }
    location { "St. Petersburg" }
    start_time { "2020-02-01T08:00:00" }
    end_time { "2020-02-01T20:00:00" }
    organizer_email { "irganizer@mail.com" }
    organizer_telegram { "@organizer" }
    link { "http://goodevent.com" }

    factory :invalid_event do
      title { nil }
      description { "Jast some event like u see early" }
      location { "St. Petersburg" }
      start_time { "2020-02-01T08:00:00" }
      end_time { "2020-02-01T20:00:00" }
      organizer_email { "irganizer@mail.com" }
      organizer_telegram { "@organizer" }
      link { "http://goodevent.com" }
    end
  end
end
