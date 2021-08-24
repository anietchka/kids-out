class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
  end
end
