require 'open-uri'
require 'json'
require 'nokogiri'
require 'faker'

Meetup.destroy_all
Participant.destroy_all
Review.destroy_all


puts "Looking for offers"
offers_sample = Offer.all.sample(5)
puts offers_sample.count

# Meetup.find_or_create_by!(user: User.last, offer: Offer.last, date: "09-09-2021", description: "foo")

puts "Creating 5 meetups"

5.times do

  offer = Offer.all.sample

  if offer.permanent == false
    meetup_date = rand(offer.start_date..offer.end_date) + rand(10..18).hours
  else
    meetup_date = rand(Date.today..(Date.today + 1.month)) + rand(10..18).hours
  end

  meetup = Meetup.find_or_create_by!(
    user: User.last(50).sample,
    offer: offer,
    date: meetup_date,
    description: Faker::Lorem.sentence
  )

  # participants_number = rand(1..7)
  users_sample = User.last(50).sample(rand(1..7))

  # Participant.find_or_create_by!(user: User.all.sample, meetup: Meetup.all.sample)

  users_sample.each do |user|
    participant = Participant.find_or_create_by!(
      user: user,
      meetup: meetup
    )
  end

end

