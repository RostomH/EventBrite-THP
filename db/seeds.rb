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

10.times do User.create(
    email: Faker::Internet.email, 
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::GreekPhilosophers.quote
    )
  end

  Event.create(
    start_date: Faker::Date.forward(days: 30),
    duration: 30,
    title: "La kermesse du quartier",
    description: "Jeux, tombolas, gâteaux, célébrons le quartier ensemble !",
    price: 20,
    location: cities.sample,
    admin_id: User.last.id
  )
  
  9.times do Event.create(
    start_date: Faker::Date.forward(days: 30),
    duration: rand(5..100) * 5,
    title: Faker::Music::RockBand.name,
    description: Faker::Lorem.sentence(word_count: 20),
    price: rand(1..1000),
    location: cities.sample,
    admin_id: User.all.shuffle.last.id
  )
  end
  
  
  Attendance.create(
    stripe_customer_id: "123456",
    user_id: User.first.id,
    event_id: Event.first.id
  )

  9.times do Attendance.create(
    stripe_customer_id: rand(1..999999).to_s,
    user_id: User.all.shuffle.first.id,
    event_id: Event.all.shuffle.first.id
  )
  end

  puts "seed ok"