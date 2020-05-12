# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
User.destroy_all
Event.destroy_all
Attendance.destroy_all
cities = ["Paris", "Bordeaux", "Lyon", "Marseille", "Lille", "Rennes", "Nice", "Strasbourg"]

User.create(
    email: "rostom75012@yopmail.com", 
    encrypted_password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::GreekPhilosophers.quote
    )
  

  
  Event.create(
    start_date: Faker::Date.forward(days: 30),
    duration: 30,
    title: "La kermesse du quartier",
    description: "Jeux, tombolas, gâteaux, célébrons le quartier ensemble !",
    price: 20,
    location: cities.sample,
    admin_id: User.last.id
  )
  
  Attendance.create(
    stripe_customer_id: "123456",
    user_id: User.first.id,
    event_id: Event.first.id
  )

  puts "seed ok"