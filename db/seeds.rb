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
User.destroy_all

puts "Creating users"
5.times do
  User.create(
    email: Faker::Internet.email,
    password: "123456"
  )
end

puts "Creating admin user"
User.create(
  email: "nacho@gmail.com",
  password: "123456",
  admin: true
)

addresses = [
  "Valladolid 91, C. U. Benito Juárez, Cuauhtémoc, 06721 Ciudad de México, CDMX",
  "Cto Interior Avenida Río Churubusco 1804, Gabriel Ramos Millán, Iztacalco, 08730 Ciudad de México, CDMX"
]

trash_pics = [
  "https://www.inquirer.com/resizer/GpgQ4VUJ4Ba3v1XbXgug1jRwRjU=/760x507/smart/filters:format(webp)/cloudfront-us-east-1.images.arcpublishing.com/pmn/JML3PK5MCBF5FKH7HKFIKBZMUY.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0wdh5dqRmOfY3xB08SgGlF1MnDT_rlyrIPw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKsd-PZ72KWeFXBcUMrCbEtzwtBdXfVGK-Yg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYD5aFc2WycxANA4SPYsPuUqgeLYqRjTcb8A&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtW61Fqy5BfoHXFodtmr1HXQhSA9Gkl9n7ng&usqp=CAU"
]

puts "Creating cleaning stations"
for i in (0..1)
  cleaning_station = CleaningStation.new(
    name: Faker::Company.name,
    address: addresses[i]
  )
  cleaning_station.save

  5.times do
    file = URI.open(trash_pics.sample)
    post = Post.new(
      description: Faker::Lorem.sentence,
      latitude: cleaning_station.latitude + rand(0..0.1),
      longitude: cleaning_station.longitude + rand(0..0.1),
      user: User.all.sample
    )
    post.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    post.save
  end
end
