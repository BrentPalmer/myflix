# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name:"Comedies")
Category.create(name:"Action")
Category.create(name:"Dramas")
Category.create(name:"Romance")
Category.create(name:"Scary")

south_park = Video.create(title: "South Park", description: "Four boys in a small town get into shananigains.", small_cover_url: "south_park.jpg", large_cover_url: "", category_id: 1)
Video.create(title: "Family Guy", description: "Family of five have crazy flashbacks.", small_cover_url: "family_guy.jpg", large_cover_url: "", category_id: 1)
Video.create(title: "Futurama", description: "Space comedy.", small_cover_url: "futurama.jpg", large_cover_url: "", category_id: 1)
Video.create(title: "South Park", description: "Four boys in a small town get into shananigains.", small_cover_url: "south_park.jpg", large_cover_url: "", category_id: 1)
Video.create(title: "Family Guy", description: "Family of five have crazy flashbacks.", small_cover_url: "family_guy.jpg", large_cover_url: "", category_id: 1)
Video.create(title: "Futurama", description: "Space comedy.", small_cover_url: "futurama.jpg", large_cover_url: "", category_id: 1)

Brent = User.create(name:"Brent", email:"brent@brent.com", password:"password")

Review.create(user: Brent, video: south_park, rating: 4, content: "Funny Show!")
Review.create(user: Brent, video: south_park, rating: 2, content: "Not too Funny Show!")