class MeetupsController < ApplicationController
  def new
    @offer = Offer.find(params[:offer_id])
    @user = current_user
    @meetup = Meetup.new
    skip_authorization
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @user = current_user
    @meetup = Meetup.new(meetups_params)
    @meetup.offer = @offer
    @meetup.user = @user
    authorize @meetup
    @meetup.save
    redirect_to offer_path(@offer)
  end

  def show
    @meetup = Meetup.find(params[:id])
    authorize @meetup
  end

  def destroy
    @offer = Offer.find(params[:offer_id])
    @meetup = Meetup.find(params[:id])
    authorize @meetup
    @meetup.destroy
    redirect_to offer_path(@offer)
  end

  private

  def meetups_params
    params.require(:meetup).permit(:description, :date)
  end
end
