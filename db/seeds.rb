# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.create(title: "South Park", description: "Four boys in a small town get into shananigains.", small_cover_url: "south_park.jpg", large_cover_url: "")
Video.create(title: "Family Guy", description: "Family of five have crazy flashbacks.", small_cover_url: "family_guy.jpg", large_cover_url: "")
Video.create(title: "Futurama", description: "Space comedy.", small_cover_url: "futurama.jpg", large_cover_url: "")

Category.create(name:"Comedies")
Category.create(name:"Action")
Category.create(name:"Dramas")
Category.create(name:"Romance")
Category.create(name:"Scary")