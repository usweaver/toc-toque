require 'faker'
require 'date'

puts "On efface la base de donnée"

Booking.destroy_all
Chef.destroy_all
User.destroy_all


puts "On créé de nouveaux users"

50.times do
    p User.create(
      first_name: Faker::Name.name,
      last_name: Faker::Artist.name,
      email: Faker::Internet.email,
      password: "123456"
    )
end

puts "On créé de nouveaux chefs"
photos = ["remyShift", "Samsam69004", "usweaver", "lea3738", "Wael-Dev52", "Pereiraadri", "puts-HIROSIE", "Aurelie-bouchon", "ClementTHZ", "AlexandreVlt", "juliavitu"]
50.times do
  p Chef.create(
    first_name: Faker::Name.name,
    last_name: Faker::Artist.name,
    category: "French",
    # phone_number:Faker::Config.locale = 'da-DK' Faker::PhoneNumber.cell_phone_with_country_code,
    phone_number: "06 75 67 82 18",
    email: Faker::Internet.email,
    daily_price: Faker::Number.number(digits: 3),
    city: Faker::Address.city,
    user_id: User.all.sample.id,
    profile_picture_url: "https://github.com/#{photos.sample}.png"
  )
end

puts "On créé de nouveaux bookmarks"

50.times do
  p Booking.create(
    start_date: Date.today,
    end_date: Date.today + rand(1..10).days,
    user_id: User.all.sample.id,
    chef_id: Chef.all.sample.id
  )
end
