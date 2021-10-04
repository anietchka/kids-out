class MeetupsController < ApplicationController
  def new
    @offer = Offer.find(params[:offer_id])
    @user = current_user
    @meetup = Meetup.new
    skip_authorization
  end

  def index
    @meetups = policy_scope(Meetup)
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @user = current_user
    @meetup = Meetup.new(meetups_params)
    @meetup.offer = @offer
    @meetup.user = @user
    authorize @meetup
    @meetup.save
    @meetup.participants.create(user: current_user)
    redirect_to offer_path(@offer, card_flipped: true)
  end

  def show
    @meetup = Meetup.find(params[:id])
    authorize @meetup
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    @user = current_user
    authorize @meetup
    @meetup.destroy
    redirect_to user_meetups_meetups_path(@user)
  end

  def chat
    @meetup = Meetup.find(params[:id])
    @message = Message.new
    authorize @meetup
  end

  def edit
    @meetup = Meetup.find(params[:id])
  end

  def user_meetups
    @meetups = current_user.meetups
    skip_authorization
  end

  private

  def meetups_params
    params.require(:meetup).permit(:description, :date)
  end
end
