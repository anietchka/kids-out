class MessagesController < ApplicationController

  def create
    @meetup = Meetup.find(params[:meetup_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.meetup = @meetup
    authorize @message
    if @message.save
      redirect_to chat_meetup_path(@meetup, anchor: "message-#{@message.id}")
    else
      render "meetups/chat"
    end
    MeetupChannel.broadcast_to(
    @meetup,
    render_to_string(partial: "message", locals: { message: @message })
)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
