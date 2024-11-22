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

  file = URI.parse("https://github.com/ClementTHZ.png").open
  user = User.new(
    first_name: "Clément",
    last_name: "Thorez",
    email: "clement_thorez@gmail.com",
    password: "123456",
    )
  user.profile_picture.attach(io: file, filename: "ClementTHZ.png", content_type: "image/png")
  user.save

# 11.times do
#   user_image = photos.sample
#   file = URI.parse("https://github.com/#{user_image}.png").open
#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "123456",
#     )
#     user.profile_picture.attach(io: file, filename: "#{user_image}.png", content_type: "image/png")
#     user.save
#     photos.delete(user_image)
#   end

  puts "On créé de nouveaux chefs"
photos = ["remyShift", "Samsam69004", "usweaver", "lea3738", "Wael-Dev52", "Pereiraadri", "puts-HIROSIE", "Aurelie-bouchon", "ClementTHZ", "AlexandreVlt", "juliavitu"]
category = ["Français", "Asiatique", "Italien", "Corse", "Japonais", "Coréen", "Mexicain"]
chefs = [
  { first_name: "Philippe", last_name: "Etchebest", category: "Corse", city: "22 rue des Capucins 69001 Lyon", image: "https://resize.elle.fr/square/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/news-de-la-redaction/top-chef-2018-philippe-etchebest-plus-joueur-que-jamais-avec-l-epreuve-de-la-boite-noire-3626183/85978205-1-fre-FR/Top-Chef-2018-Philippe-Etchebest-plus-joueur-que-jamais-avec-l-epreuve-de-la-boite-noire.jpg" },
  { first_name: "Paul", last_name: "Bocuse", category: "Français", city: "79, rue Hippolyte Kahn 69100 Villeurbanne", image: "https://www.francetvinfo.fr/pictures/zUS3k9x8LIdtbCxwV-g7tmUpPqU/1200x1200/2019/04/11/paul_bocuse.jpg" },
  { first_name: "Michel", last_name: "Sarran", category: "Coréen", city: "Place Bellecour 69002 Lyon", image: "https://www.programme-tv.net/imgre/fit/~1~tel~2024~02~16~fd0a5ea3-12c0-42d2-b2f0-e47f99e05bae.png/630x630/quality/80/c-est-complique-michel-sarran-evoque-son-avenir-dans-la-meilleure-boulangerie-de-france.jpg" },
  { first_name: "Zeff", last_name: "", category: "Japonais", city: "Place Jean Macé 69007 Lyon", image: "https://i.pinimg.com/736x/9c/bc/69/9cbc6929326581574c646202e9ffe8c4.jpg" },
  { first_name: "Hannibal", last_name: "Lecter", category: "Asiatique", city: "Place Saint-Jean 69005 Lyon", image: "https://repliquemangacine.fr/wp-content/uploads/2023/10/Sans-titre-1.jpg" },
  { first_name: "Maïté", last_name: "", category: "Italien", city: "Gorge de Loup 69009 Lyon", image: "https://www.francetvinfo.fr/pictures/xpnH2vM_hZqteZWSRdr5vJfNnfE/1200x1200/2023/01/12/63c024ae1eac8_cuisine-des-mousquetaires-le-retour-00-00-38-13.jpg" },
  { first_name: "Gordon", last_name: "Ramsay", category: "Mexicain", city: "Gros caillou 69004 Lyon", image: "https://i.redd.it/a7b7pgnd8wkb1.jpg" },
]

chefs.each do |chef|
  file = URI.parse(chef[:image]).open
  combination = "#{chef[:first_name].downcase}_#{chef[:last_name].downcase}"
  new_chef = Chef.new(
    first_name: chef[:first_name],
    last_name: chef[:last_name],
    category: chef[:category],
    phone_number: "06 75 67 82 18",
    email: "#{combination}@gmail.com",
    daily_price: Faker::Number.number(digits: 3),
    city: chef[:city],
    user_id: user.id,
  )
  new_chef.chef_picture.attach(io: file, filename: "#{combination}.jpg", content_type: "image/jpg")
  new_chef.save
end


# 30.times do
#   chef_image = photos.sample
#   file = URI.parse("https://github.com/#{chef_image}.png").open
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   chef = Chef.new(
#     first_name: first_name,
#     last_name: last_name,
#     category: category.sample,
#     # phone_number:Faker::Config.locale = 'da-DK' Faker::PhoneNumber.cell_phone_with_country_code,
#     phone_number: "06 75 67 82 18",
#     email: "#{first_name.downcase}_#{last_name.downcase}@gmail.com",
#     daily_price: Faker::Number.number(digits: 3),
#     city: cities.sample,
#     user_id: User.all.sample.id,
#   )
#   chef.chef_picture.attach(io: file, filename: "#{chef_image}.png", content_type: "image/png")
#   chef.save
# end

puts "On créé de nouveaux bookings"

50.times do
  Booking.create(
    start_date: Date.today,
    end_date: Date.today + rand(1..10).days,
    user_id: User.all.sample.id,
    chef_id: Chef.all.sample.id
  )
end

puts "Seeding completed ✅"
