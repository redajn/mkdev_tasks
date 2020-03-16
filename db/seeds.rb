event_list = [
  { title: 'Anniversary event',
    description: 'Jast some event like u see early',
    location: 'St. Petersburg',
    starttime: "2020-02-01T08:00:00",
    endtime: "2020-02-01T20:00:00",
    organizeremail: 'irganizer@mail.com',
    organizertelegram: '@organizer',
    link: 'http://goodevent.com'
  },
  { title: 'Chrismas Event',
    description: 'And another event',
    location: 'Moscow',
    starttime: "2020-01-15T20:00:00",
    endtime: "2020-01-15T22:00:00",
    organizeremail: 'irganizer@mail.com',
    organizertelegram: '@organizer',
    link: 'http://anothervent.com'
  },
  { title: 'Summer event',
    description: 'Summer event',
    location: 'Ibiza',
    starttime: "2020-06-10T20:00:00",
    endtime: "2020-06-11T10:00:00",
    organizeremail: 'irganizer@mail.com',
    organizertelegram: '@organizer',
    link: 'http://andanotheroneevent.com'
  },
  { title: 'Internetional 2020',
    description: 'Dota champ',
    location: 'Stockholm',
    starttime: "2020-08-10T20:00:00",
    endtime: "2020-08-20T10:00:00",
    organizeremail: 'irganizer@mail.com',
    organizertelegram: '@organizer',
    link: 'http://andanotheroneevent.com'
  },
  { title: 'Olimpic game',
    description: 'asdasdad',
    location: 'Ibiza',
    starttime: "2020-06-10T20:00:00",
    endtime: "2020-06-11T10:00:00",
    organizeremail: 'irganizer@mail.com',
    organizertelegram: '@organizer',
    link: 'http://andanotheroneevent.com'
  },
  { title: 'Any holidays',
    description: 'Summer event',
    location: 'Ibiza',
    starttime: "2020-06-10T20:00:00",
    endtime: "2020-06-11T10:00:00",
    organizeremail: 'irganizer@mail.com',
    organizertelegram: '@organizer',
    link: 'http://andanotheroneevent.com'
  },
]

event_list.each do |attributes|
  event = Event.new
  event.title = attributes[:title]
  event.description = attributes[:description]
  event.location = attributes[:location]
  event.starttime = attributes[:starttime]
  event.endtime = attributes[:endtime]
  event.organizeremail = attributes[:organizeremail]
  event.organizertelegram = attributes[:organizertelegram]
  event.link = attributes[:link]
  event.save
end
