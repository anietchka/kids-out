class Meetup < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy
  validates :date, presence: true
  validates :description, presence: true
end
