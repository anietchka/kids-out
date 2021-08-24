class BookingsController < ApplicationController

  def new
    authorize @booking
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.offer = @offer
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to  offer_booking_path(@offer, @booking)
    else
      redirect_to  offer_booking_path(@offer, @booking)
    end
  end

end
