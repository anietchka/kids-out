class ParticipantsController < ApplicationController



  def create
    @meetup = Meetup.find(params[:meetup_id])
    @participant = Participant.new
    @participant.meetup = @meetup
    @participant.user = current_user
    authorize @participant
    @participant.save
    redirect_to meetup_path(@meetup)
  end

  def destroy
    @participant = Participant.find(params[:id])
    authorize @participant
    @participant.destroy
    redirect_to meetup_path(@participant.meetup)
  end
end
