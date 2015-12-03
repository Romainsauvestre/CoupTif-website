# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Hairdresser.create(
    first_name: "Bruno",
    last_name: "Martinaud",
    description: " Coiffeur depuis 20 ans",
    photo: "http://www.my-business-plan.fr/sites/default/files/fichiers/images/articles/bruno%20martinaud.jpg",
    lat: 48.8771744,
    lng: 2.3013612
)


Hairdresser.create(
    first_name: "Olivier",
    last_name: "Moindrot",
    description: "Specialise dans la coiffure pour homme",
    photo: "http://www.boutique-auroyaumedumariage.com/catalog/imgcache/260234ARDM6121351259891167260102234.jpg",
    lat: 48.8658748,
    lng: 2.3757088
)

Hairdresser.create(
    first_name: "Adrien",
    last_name: "Gsell",
    description: " Coiffeur depuis 5 ans",
    photo: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/8/000/261/2cb/2624c3a.jpg",
    lat: 48.8658748,
    lng: 2.3757088
)

Hairdresser.create(
    first_name: "Ghyslain",
    last_name: "De Juvigny",
    description: " Coiffeur depuis 10 ans",
    photo: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAJEAAAAJDdkMGFkNTIwLWFiYWEtNGQ5Ny05NWU0LTRiOTk4MTUwZGEwOA.jpg",
    lat: 48.8658748,
    lng: 2.3757088
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

Calendar.create(
    day: "2015-12-04",
    available: true,
    start_time: "09:00:00.000",
    end_time: "16:00:00.000",
    hairdresser_id: 1
)

Calendar.create(
    day: "2015-12-05",
    available: false,
    hairdresser_id: 1
)


Calendar.create(
    day: "2015-12-06",
    available: false,
    hairdresser_id: 1
)


Calendar.create(
    day: "2015-12-24",
    available: false,
    hairdresser_id: 1
)

Calendar.create(
    day: "2015-12-25",
    available: false,
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