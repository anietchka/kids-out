# controllers/offer
class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_offer, only: [:show]

  # GET /offers
  def index
    @offers = policy_scope(Offer)

    # Start by fetching all records and filter out records
    @offers = Offer.joins(:categories).all

    # Filter to results near given coordinates
    # Geocordinates from text
    if params[:search] && params[:search][:latitude].present?
      @offers = @offers.near([params[:search][:latitude], params[:search][:longitude]], 5)
    end
    # Geocordinates from button
    if params[:search] && params[:search][:address].present?
      @offers = @offers.near(params[:search][:address], 5)
    end

    # Filter to results equal to user input on fields
    # Minimum Age
    if params[:search] && params[:search][:min_age].present?
      @offers = @offers.where('min_age <= ?', params[:search][:min_age])
    end
    # Indoor / Outdoor
    if params[:search] && params[:search][:theme].present?
      @offers = @offers.where('theme = ?', params[:search][:theme])
    end
    # with Meetup
    if params[:search] && (params[:search][:meetup] == "1")
      @offers = @offers.joins(:meetups)
    end
    # Categories
    if params[:search] && params[:search][:categories].present?
      @offers = @offers.where('categories.name = ?', params[:search][:categories])
    end

    # Date
    # FIXME: this query remove every permanent offers, and it shouldn't...
    if params[:search] && params[:search][:date].present?
      @offers = @offers.where('start_date <= ?', params[:search][:date])
      @offers = @offers.where('end_date <= ?', params[:search][:date])
    end

    # Create markers out of resulting offers from query
    # the `geocoded` method filters out offers that can't be geocoded
    @markers = @offers.geocoded.map do |offer|
      icon_filename = 'marker.png'
      if offer.categories.any?
        category_filename = "#{offer.categories.first.name.parameterize}.png"
        icon_filename = category_filename if asset_present?(category_filename)
      end
      # conditional to remove outliers
      if (offer.latitude >= 48.5 && offer.latitude <= 49.5) && (offer.longitude >= 1.7 && offer.longitude <= 2.9)
        {
          lat: offer.latitude,
          lng: offer.longitude,
          info_window: render_to_string(partial: "info_window", locals: { offer: offer }),
          icon: helpers.asset_url(icon_filename)
        }
      end
    end
  end

  # GET /offers/1
  def show
    @review = Review.new
    authorize @offer
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    authorize @offer
  end

  # POST /offers
  def create
    @offer = Offer.new(offers_params)
    @offer.user = current_user
    authorize @offer

    @offer.save
    redirect_to offer_path(@offer)
  end

  private

  def asset_present?(asset_path)
    # Method to ensure that an icon image is always provided
    if Rails.env.development?
      Rails.application.assets.find_asset(asset_path) != nil
    else
      @asset_files ||= Rails.application.assets_manifest.files.values.map { |asset| asset['logical_path'] }
      @asset_files.include?(asset_path)
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def offers_params
    params.require(:offer).permit(:name, :theme, :address, :start_date, :end_date, :url, :permanent, :description, :min_age, :max_age, :schedule, :longitude, :latitude, :user_id)
  end
end
