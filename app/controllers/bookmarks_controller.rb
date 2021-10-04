class BookmarksController < ApplicationController

  def index
    @bookmarks = policy_scope(Bookmark)
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @bookmark = Bookmark.new
    @bookmark.offer = @offer
    @bookmark.user = current_user
    authorize @bookmark
    @bookmark.save
    redirect_to  offer_path(@offer)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.destroy
    redirect_back(fallback_location: bookmarks_path)
  end

end
