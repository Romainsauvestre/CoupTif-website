# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Hairdresser.create(
    first_name: "Jean",
    last_name: "Pierre",
    description: " Coiffeur depuis 20 ans",
    photo: "http://static.astucesdefilles.com/wp-content/uploads/2015/03/42.jpg",
    lat: 48.8771744,
    lng: 2.3013612
)


Hairdresser.create(
    first_name: "Jean",
    last_name: "Michel",
    description: " Coiffeur depuis 10 ans",
    photo: "http://blog.rdv-coiffeur.fr/wp-content/uploads/2015/04/coiffeur.jpg",
    lat: 48.8658748,
    lng: 2.3757088
)

Service.create(
    name: "Coupe Homme",
    description: "Coupe simple et pas cher",
    price: 10.0,
    hairdresser_id: 1
)

Calendar.create(
    day: "2015-11-25",
    available: true,
    start_time: "08:00:00.000",
    end_time: "20:00:00.000",
    hairdresser_id: 1
)

Calendar.create(
    day: "2015-11-26",
    available: true,
    start_time: "08:00:00.000",
    end_time: "16:00:00.000",
    hairdresser_id: 1
)


Slot.create(
    start_time: "09:00:00.000",
    end_time: "10:30:00.000",
    calendar_id: 1
)


Slot.create(
    start_time: "11:00:00.000",
    end_time: "12:30:00.000",
    calendar_id: 1
)


Slot.create(
    start_time: "14:30:00.000",
    end_time: "16:30:00.000",
    calendar_id: 1
)