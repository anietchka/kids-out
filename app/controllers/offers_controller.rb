class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offers_params)
    @offer.user = current_user
    authorize @offer

    @offer.save
    redirect_to offer_path(@offer)
  end

  def index
    @offers = policy_scope(Offer)
    if params[:query].present?
      @offers = Offer.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @offers = Offer.all
    end
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer }),
        icon: helpers.asset_url("#{offer.categories.first&.name.parameterize}.png" || 'marker.png')
      }
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @review = Review.new
    authorize @offer
  end

  private

  def offers_params
    params.require(:offer).permit(:name, :address, :start_date, :end_date, :url, :permanent, :description, :min_age, :max_age, :schedule, :longitude, :latitude, :user_id )
  end


end
