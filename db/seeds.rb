require 'faker'
require 'date'
require 'open-uri'
Faker::Config.locale = 'fr'
puts "On efface la base de donnée"

Booking.destroy_all
Chef.destroy_all
User.destroy_all

photos = ["remyShift", "Samsam69004", "usweaver", "lea3738", "Wael-Dev52", "Pereiraadri", "puts-HIROSIE", "Aurelie-bouchon", "ClementTHZ", "AlexandreVlt", "juliavitu"]

puts "On créé de nouveaux users"

11.times do
  user_image = photos.sample
  file = URI.parse("https://github.com/#{user_image}.png").open
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    )
    user.profile_picture.attach(io: file, filename: "#{user_image}.png", content_type: "image/png")
    user.save
    photos.delete(user_image)
  end

  puts "On créé de nouveaux chefs"
photos = ["remyShift", "Samsam69004", "usweaver", "lea3738", "Wael-Dev52", "Pereiraadri", "puts-HIROSIE", "Aurelie-bouchon", "ClementTHZ", "AlexandreVlt", "juliavitu"]
category = ["Français", "Asiatique", "Italien", "Corse", "Japonais", "Coréen", "Mexicain"]

30.times do
  chef_image = photos.sample
  file = URI.parse("https://github.com/#{chef_image}.png").open
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  chef = Chef.new(
    first_name: first_name,
    last_name: last_name,
    category: category.sample,
    # phone_number:Faker::Config.locale = 'da-DK' Faker::PhoneNumber.cell_phone_with_country_code,
    phone_number: "06 75 67 82 18",
    email: "#{first_name.downcase}_#{last_name.downcase}@gmail.com",
    daily_price: Faker::Number.number(digits: 3),
    city: Faker::Address.city,
    user_id: User.all.sample.id,
  )
  chef.chef_picture.attach(io: file, filename: "#{chef_image}.png", content_type: "image/png")
  chef.save
end

puts "On créé de nouveaux bookmarks"

50.times do
  Booking.create(
    start_date: Date.today,
    end_date: Date.today + rand(1..10).days,
    user_id: User.all.sample.id,
    chef_id: Chef.all.sample.id
  )
end

puts "Seeding completed ✅"
