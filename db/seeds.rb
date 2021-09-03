# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "open-uri"
puts "Destroying posts and cleaning stations"
Post.destroy_all
CleaningStation.destroy_all

puts "Creating cleaning stations"
5.times do
  cleaning_station = CleaningStation.new(
    address: Faker::Address.full_address
  )
  cleaning_station.save

  2.times do
    file = URI.open('https://source.unsplash.com/random')
    post = Post.new(
      description: Faker::Lorem.sentence,
      latitude: cleaning_station.latitude + rand(0..0.1),
      longitude: cleaning_station.longitude + rand(0..0.1),
      user_id: 1
    )

    post.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    post.save
  end
end
