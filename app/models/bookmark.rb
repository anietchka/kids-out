class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :user, uniqueness: { scope: :offer }
end
