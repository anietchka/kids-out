class Meetup < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :participants
  validates :date, presence: true
  validates :description, presence: true
end
