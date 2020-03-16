FactoryBot.define do
  factory :event do
    title { 'Anniversary event' }
    description { 'Jast some event like u see early' }
    location { 'St. Petersburg' }
    starttime { "2020-02-01T08:00:00" }
    endtime { "2020-02-01T20:00:00" }
    organizeremail { 'irganizer@mail.com' }
    organizertelegram { '@organizer' }
    link { 'http://goodevent.com' }

    factory :invalid_event do
      title { nil }
      description { 'Jast some event like u see early' }
      location { 'St. Petersburg' }
      starttime { "2020-02-01T08:00:00" }
      endtime { "2020-02-01T20:00:00" }
      organizeremail { 'irganizer@mail.com' }
      organizertelegram { '@organizer' }
      link { 'http://goodevent.com' }
    end
  end

end
