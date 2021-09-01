require 'open-uri'
require 'json'
require 'nokogiri'
require 'faker'

User.destroy_all

puts 'Creating a lot of User'
user_1 = User.new(email: 'anna.bozio@gmail.com', nickname: "anietchka", password: '123456', first_name: 'Anna', last_name: 'Bozio')
user_2 = User.create!(email: 'migatsar@gmail.com', nickname: "migasar", password: '123456', first_name: 'Mickael', last_name: 'Gaspar')
user_3 = User.create!(email: 'estelle.cirilo@gmail.com', nickname: "ecirilo1", password: '123456', first_name: 'Estelle', last_name: 'Cirilo')
user_4 = User.create!(email: 'barois.anne@orange.fr', nickname: "oslanne", password: '123456', first_name: 'Anne', last_name: 'Barois')
user_5 = User.create!(email: 'ville-de-paris@gmail.com', nickname: "VilleDeParis", password: '123456', first_name: 'Ville', last_name: 'de Paris')

file = URI.open('https://i.skyrock.net/4416/47814416/pics/1946552767_small_1.jpg')
user_1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user_1.save!

########################
# Fake users
puts 'Creating 50 fake users...'
50.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    nickname: Faker::Internet.unique.username,
    email: Faker::Internet.email(name: "#{:first_name} #{:last_name}", separators: '_'),
    password: Faker::Internet.password(min_length: 8)
  )
  user.save!
end

puts 'Users Created!'
