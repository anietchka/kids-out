class ReviewsController < ApplicationController

  def new
    @offer = Offer.find(params[:offer_id])
    @user = current_user
    @review = Review.new

    skip_authorization
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @user = current_user
    @review = Review.new(reviews_params)
    @review.offer = @offer
    @review.user = @user
    authorize @review
    @review.save
    redirect_to offer_path(@offer, anchor: "review-#{@review.id}")
  end

  def destroy
    @offer = Offer.find(params[:offer_id])
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to offer_path(@offer, anchor: "btn-review")
  end

  private

  def reviews_params
    params.require(:review).permit(:comment, :rating)
  end
end
