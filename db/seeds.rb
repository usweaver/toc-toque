require 'faker'
require 'date'

puts "On efface la base de donnée"

User.destroy_all
Chef.destroy_all
Booking.destroy_all

puts "On créé de nouveaux users"

50.times do
    p User.create(
      first_name: Faker::Name.name,
      last_name: Faker::Artist.name,
      email: Faker::Internet.email,
    )
end

puts "On créé de nouveaux chefs"

50.times do
  p Chef.create(
    first_name: Faker::Name.name,
    last_name: Faker::Artist.name,
    category: "French",
    # phone_number:Faker::Config.locale = 'da-DK' Faker::PhoneNumber.cell_phone_with_country_code,
    phone_number: "06 75 67 82 18"
    email: Faker::Internet.email,
    daily_price: Faker::Number.number(digits: 3),
    city: Faker::Address.city,
    user_id: User.all.sample.id
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
