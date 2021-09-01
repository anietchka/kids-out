import consumer from "./consumer";
const initMeetupCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.meetupId;

    consumer.subscriptions.create({ channel: "MeetupChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
        document.querySelector("#message_content").value = "";
      },
    });
  }
}

export { initMeetupCable };
