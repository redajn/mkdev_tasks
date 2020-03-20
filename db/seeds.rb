# frozen_string_literal: true

event_list = [
  { title: 'Anniversary event',
    description: 'Jast some event like u see early',
    location: 'St. Petersburg',
    start_time: '2020-02-01T08:00:00',
    end_time: '2020-02-01T20:00:00',
    organizer_email: 'irganizer@mail.com',
    organizer_telegram: '@organizer',
    link: 'http://goodevent.com' },
  { title: 'Chrismas Event',
    description: 'And another event',
    location: 'Moscow',
    start_time: '2020-01-15T20:00:00',
    end_time: '2020-01-15T22:00:00',
    organizer_email: 'irganizer@mail.com',
    organizer_telegram: '@organizer',
    link: 'http://anothervent.com' },
  { title: 'Summer event',
    description: 'Summer event',
    location: 'Ibiza',
    start_time: '2020-06-10T20:00:00',
    end_time: '2020-06-11T10:00:00',
    organizer_email: 'irganizer@mail.com',
    organizer_telegram: '@organizer',
    link: 'http://andanotheroneevent.com' },
  { title: 'Internetional 2020',
    description: 'Dota champ',
    location: 'Stockholm',
    start_time: '2020-08-10T20:00:00',
    end_time: '2020-08-20T10:00:00',
    organizer_email: 'irganizer@mail.com',
    organizer_telegram: '@organizer',
    link: 'http://andanotheroneevent.com' },
  { title: 'Olimpic game',
    description: 'asdasdad',
    location: 'Ibiza',
    start_time: '2020-06-10T20:00:00',
    end_time: '2020-06-11T10:00:00',
    organizer_email: 'irganizer@mail.com',
    organizer_telegram: '@organizer',
    link: 'http://andanotheroneevent.com' },
  { title: 'Any holidays',
    description: 'Summer event',
    location: 'Ibiza',
    start_time: '2020-06-10T20:00:00',
    end_time: '2020-06-11T10:00:00',
    organizer_email: 'irganizer@mail.com',
    organizer_telegram: '@organizer',
    link: 'http://andanotheroneevent.com' }
]

event_list.each do |attributes|
  event = Event.new
  event.title = attributes[:title]
  event.description = attributes[:description]
  event.location = attributes[:location]
  event.start_time = attributes[:start_time]
  event.end_time = attributes[:end_time]
  event.organizer_email = attributes[:organizer_email]
  event.organizer_telegram = attributes[:organizer_telegram]
  event.link = attributes[:link]
  event.save
end
