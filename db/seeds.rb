# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "open-uri"
Post.destroy_all

10.times do
  file = URI.open('https://source.unsplash.com/random')
  post = Post.new(
    description: Faker::Lorem.sentence,
    latitude: Faker::IDNumber.south_african_id_number,
    longitude: Faker::IDNumber.south_african_id_number,
    user_id: 1
  )

  post.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  post.save
end
