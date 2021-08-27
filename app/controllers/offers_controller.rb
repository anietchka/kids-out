# controllers/offer
class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_offer, only: [:show]

  # GET /offers
  def index
    @offers = policy_scope(Offer)

    # Start by fetching all records and filter out records
    @offers = Offer.all

    # Filter to results near given coordinates
    if !params[:search][:latitude].empty?
      @offers = @offers.near([params[:search][:latitude], params[:search][:longitude]], 1)
    end
    if !params[:search][:address].empty?
      @offers = @offers.near(params[:search][:address], 1)
    end

    # Create markers out of resulting offers from query
    # the `geocoded` method filters out offers that can't be geocoded
    @markers = @offers.geocoded.map do |offer|
      icon_filename = "#{offer.categories.first&.name&.parameterize}.png"

      unless Rails.application.assets.find_asset(icon_filename)
        icon_filename = 'marker.png'
      end

      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer }),
        icon: helpers.asset_url(icon_filename)
      }
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

  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def offers_params
    params.require(:offer).permit(:name, :theme, :address, :start_date, :end_date, :url, :permanent, :description, :min_age, :max_age, :schedule, :longitude, :latitude, :user_id)
  end

  # TODO: define the method `custom_search` to represent the different contexts of the search
  # Conditional branching to custom queries depending of the parameteres / filters /contextes of execution
  def custom_search(params)

    @offers = Offer.all

    # address
    if params[:address].present?
      @offers = @offers.search_address(params[:address])
    end

    # theme
    if params[:theme].present?
      @offers = @offers.search_theme(params[:theme])
    end
    # min_age
    if params[:min_age].present?
      @offers = @offers.search_min_age(params[:min_age])
    end

    # max_age
    if params[:max_age].present?
      if @offers == nil
        @offers = Offer.search_max_age(params[:max_age])
      else
        @offers = @offers.search_max_age(params[:max_age])
      end
    end
    # name
    if params[:name].present?
      if @offers == nil
        @offers = Offer.search_name(params[:name])
      else
        @offers = @offers.search_name(params[:name])
      end
    end
    # url
    if params[:url].present?
      if @offers == nil
        @offers = Offer.search_url(params[:url])
      else
        @offers = @offers.search_url(params[:url])
      end
    end

    # fields_offer = [
    #   "address",
    #   "theme",
    #   "min_age",
    #   "max_age",
    #   "name",
    #   "url",
    #   "description",
    #   "start_date",
    #   "end_date",
    #   "permanent",
    #   "schedule",
    #   "created_at",
    #   "updated_at",
    #   "latitude",
    #   "longitude",
    #   # "user_id",
    #   # "photo",
    # ]

    # TODO: repeat the loop if it works...
    # TODO: find a way to deal with generic query

    return @offers
    # @offers = Offer.search_name(params[:name]) if params[:name].present?
    # @offers = search_address(params[:address]) if params[:address].present?
    # return Offer.search(args)
    # return Offer.search_name(args)
  end

end
