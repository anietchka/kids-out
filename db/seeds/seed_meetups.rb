require 'open-uri'
require 'json'
require 'nokogiri'
require 'faker'

require 'time'

Meetup.destroy_all
Participant.destroy_all
Review.destroy_all

puts "Looking for offers"
offers_sample = Offer.all.sample(5)
puts offers_sample.count

# Meetup.find_or_create_by!(user: User.last, offer: Offer.last, date: "09-09-2021", description: "foo")

puts "Creating 5 meetups"
offers_sample.each do |offer|

  if offer.permanent == false
    meetup_date = rand(offer.start_date..offer.end_date)
  else
    meetup_date = rand(Date.today..(Date.today + 1.month))
  end

  meetup = Meetup.find_or_create_by!(
    user: User.all.sample,
    offer: offer,
    date: meetup_date,
    description: Faker::Lorem.sentence
  )

  participants_number = rand(1..7)
  users_sample = User.all.sample(participants_number)

  # Participant.find_or_create_by!(user: User.all.sample, meetup: Meetup.all.sample)

  users_sample.each do |user|
    participant = Participant.find_or_create_by!(
      user: user,
      meetup: meetup
    )
  end

end


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
