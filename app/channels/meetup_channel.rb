class MeetupChannel < ApplicationCable::Channel
  def subscribed
    meetup = Meetup.find(params[:id])
    stream_for meetup
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
