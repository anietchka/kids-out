# controllers/offer
class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_offer, only: [:show]

  # GET /offers
  def index
    @offers = policy_scope(Offer)
    unless mandatory_fields_present?(search_params)
      flash[:alert] = "Merci de remplir tous les champs"
      render 'pages/home'
    end

    @offers = Offer.search(search_params[:search])
    # @markers = @offers.as_markers
    # @markers = @offers.map { |offer| MarkerPresenter.new(offer) }


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
    # @offer = Offer.new(offers_params)
    # @offer.user = current_user
    # authorize @offer

    # @offer.save

    @offer = Offer.new(offers_params.to_h.merge({ user: current_user }))

    if @offer.save!
      # redirect_to offer_path(@offer)
      render json: @offer.as_json
    else
      render :new
    end
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

  def search_params
    params.require(:search).permit(
      :latitude,
      :longitude,
      :address,
      :min_age,
      :theme,
      :meetups,
      :categories,
      :date
    )
  end

  def mandatory_fields_present?(search_params)
    return false unless search_params[:search].present?
    return false unless %i(min_age theme).all? { |param| search_params[:search][param].present? }

    (search_params[:search][:latitude].present? && search_params[:search][:longitude].present?) ||
      search_params[:search][:address].present?
  end
end
