class BookmarksController < ApplicationController

  def index
    @bookmarks = policy_scope(Bookmark)
    # PUNDIT > scope > resolve
    Scope.where(user: user)
  end

  def new
    authorize @bookmark
    @offer = Offer.find(params[:offer_id])
    @bookmark = Booking.new
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @bookmark = Booking.new(bookmark_params)
    @bookmark.offer = @offer
    @bookmark.user = current_user
    authorize @bookmark
    if @bookmark.save
      redirect_to  offer_bookmark_path(@offer, @bookmark)
    else
      redirect_to  offer_bookmark_path(@offer, @bookmark)
    end
  end

end
