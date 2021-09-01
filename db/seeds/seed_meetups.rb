require 'open-uri'
require 'json'
require 'nokogiri'
require 'faker'

Meetup.destroy_all
Participant.destroy_all

Review.destroy_all

puts "Looking for offers"
offer = Offer.last(400).sample(4)
puts offer.count

########################
# Meetups
# puts 'Creating fake Meetups...'

# 10.times do

#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name:  Faker::Name.last_name,
#     nickname: Faker::Internet.unique.username,
#     email: Faker::Internet.email(name: "#{:first_name} #{:last_name}", separators: '_'),
#     password: Faker::Internet.password(min_length: 8)
#   )
#   user.save!
# end

# puts 'Meetups Created!'


########################
# Reviews
# puts 'Creating Reviews'

# puts 'Reviews Created!'
