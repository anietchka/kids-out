class MessagesController < ApplicationController
  def create
    @meetup = Meetup.find(params[:meetup_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.meetup = @meetup
    authorize @message
    if @message.save
    #   redirect_to meetup_path(@meetup, anchor: "message-#{@message.id}")
      MeetupChannel.broadcast_to(
        @meetup,
        { html: render_to_string(partial: "message", locals: { message: @message }), user_id: @message.user.id.to_s }
      )
    else
    #   render "meetups/chat"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
