class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @user = User.find(params[:user_id])
    @offer = Offer.new(offers_params)
    @offer.user = @user
    authorize @offer
    @offer.save
    redirect_to root_path
  end

  def index
    @offers = policy_scope(Offer)

    # the `geocoded` scope filters only offers with coordinates (latitude & longitude)
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer })
      }
    end
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  private

  def offers_params
    params.require(:offer).permit(:name, :address, :start_date, :end_date, :url, :permanent, :description, :min_age, :max_age, :schedule, :longitude, :latitude, :user_id )
  end


end
