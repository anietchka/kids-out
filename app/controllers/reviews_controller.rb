class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review)
  end

  def new
    @offer = Offer.find(params[:offre_id])
    @user = current_user
    @review = review.new
    authorize @review
    skip_authorisation
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @user = current_user
    @review = Review.new(reviews_params)
    authorize @review
    @review.offer = @offer
    @review.user = @user
    @review.save
    redirect_to offer_path(@offer)
  end

  private

  def reviews_params
    params.require(:review).permit(:comment, :rating)
  end
end
