class OfferCategory < ApplicationRecord
  belongs_to :category
  belongs_to :offer
end
