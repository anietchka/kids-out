class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  has_many :bookmarks, dependent: :destroy
  has_many :offers
  has_many :reviews, dependent: :destroy
  has_many :participants
  has_many :meetups, through: :participants
  has_many :owned_meetups, class_name: 'Meetup'
  has_many :messages
  has_many :participants_as_owner, through: :meetups, source: :participants
end
