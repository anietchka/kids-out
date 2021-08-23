class Category < ApplicationRecord
  has_many :offer_categories
  validates :name, presence: true
end
