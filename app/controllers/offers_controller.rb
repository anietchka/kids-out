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
    #  A tester
    # @offers = @offers.where(min_age: params.dig(:search, :min_age)) if params.dig(:search, :min_age) && params.dig(:search, :min_age) != ""
    # @offers = Offer.where("address ILIKE ?", "%#{params[:query]}%") if params[:query].present? != ""
    if params[:query].present?
      @offers = Offer.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @offers = Offer.all
    end
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
    @review = Review.new
    authorize @offer
  end

  private

  def offers_params
    params.require(:offer).permit(:name, :address, :start_date, :end_date, :url, :permanent, :description, :min_age, :max_age, :schedule, :longitude, :latitude, :user_id )
  end


end
