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
  has_many :reviews, dependent: :destroy
  has_many :meetups, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  scope :with_meetups, -> { joins(:meetups) }
  scope :with_theme_outside, -> { where(theme: "exterieure") }
  scope :with_theme, ->(theme) { where(theme: theme) }

  # SELECT *
  # FROM offers
  # OUTER JOIN categories ON categories.id = offers.category_id
  # WHERE categories.name = "outside"
  def self.search(filters)
    return Offer.all if filters.nil?

    # Start by fetching all records and filter out records
    query = Offer.joins(:categories).includes(:categories)

    # Filter to results near given coordinates
    # Geocordinates from text
    query = query.near([filters[:latitude], filters[:longitude]], 5) if filters[:latitude].present?
    query = query.near(filters[:address], 5) if filters[:address].present?

    # Filter to results equal to user input on fields
    # Minimum Age
    query = query.where('min_age <= ?', filters[:min_age]) if filters[:min_age].present?

    # Indoor / Outdoor
    query = query.with_theme(filters[:theme]) if filters[:theme].present?

    # with Meetup
    query = query.with_meetups if filters[:meetup] == "1"

    # Categories
    query = query.where('categories.name = ?', filters[:categories]) if filters[:categories].present?

    # Date
    # FIXME: this query remove every permanent offers, and it shouldn't...
    if filters[:date].present?
      query = query.where('start_date <= ?', filters[:date]).where('end_date <= ?', filters[:date])
    end

    query.load
  end

  private

  def ensure_date_have_values
    if permanent == true
      self.start_date = "31-12-2000"
      self.end_date = "31-12-2100"
    end
  end
end
