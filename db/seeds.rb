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