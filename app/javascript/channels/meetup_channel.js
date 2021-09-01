import consumer from "./consumer";
const initMeetupCable = () => {
  const messagesContainer = document.getElementById('messages');
  const userId = document.querySelector('.card-chat').dataset.userId

  if (messagesContainer) {
    const id = messagesContainer.dataset.meetupId;

    consumer.subscriptions.create({ channel: "MeetupChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
        messagesContainer.insertAdjacentHTML('beforeend', data.html);

        console.log(userId)
        console.log(data.user_id)

        if (data.user_id !== userId) {
          const messages = document.querySelectorAll('.message-container')
          // console.log(messages)
          const lastMessage = messages[messages.length - 1]
          // console.log(lastMessage)
          lastMessage.classList.remove('currentuser')
          lastMessage.classList.add('otheruser')
        } 

        document.querySelector("#message_content").value = "";
      },
    });
  }
}

export { initMeetupCable };
