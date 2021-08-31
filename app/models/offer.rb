class Offer < ApplicationRecord
  THEME = %w[interieure exterieure]
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  before_create :ensure_date_have_values
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true
  validates :theme, inclusion: { in: THEME }
  has_many :offer_categories
  has_many :categories, through: :offer_categories
  has_many :reviews
  has_many :meetups
  has_many :bookmarks

  private

    def ensure_date_have_values
      if permanent == true
        self.start_date = "31-12-2000"
        self.end_date = "31-12-2100"
      end
    end
end
