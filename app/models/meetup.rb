class Meetup < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :name, presence: true
  validates :date, presence: true
  validates :description, presence: true
end
