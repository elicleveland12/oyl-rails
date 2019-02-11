# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ui = User.create(username: "User1", password:"password", image: "some link")

v1 = Vehicle.create(year: 1991, make:"Ford", model: "Bronco", plate:"speed", user_id: 1)
