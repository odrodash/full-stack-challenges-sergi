/* eslint-disable no-multiple-empty-lines */

const hasNewMessage = () => {
  // TODO: return true with a probability of 20%.
  const random = [true, false, false, false, false];
  const randomNumber = Math.floor(Math.random() * random.length);

  if (randomNumber === 1) {
    return true;
  }
  if (randomNumber >= 2) {
    return false;
  }
  return false;
};


const newMessage = () => {
  // TODO: return a random message as an object with two keys, subject and sender
  const senders = ["GitHub Team", "Arnold Schwarzenegger", "Google", "Youtube"];
  const subjects = ["Welcome to GitHub", "I am back!", "Hello world", "Youtube premiun"];

  const random = Math.floor(Math.random() * senders.length);
  const random2 = Math.floor(Math.random() * subjects.length);

  return {
    sender: senders[random],
    subject: subjects[random2]
  };
};
const appendMessageToDom = (message) => {
  // TODO: append the given message to the DOM (as a new row of `#inbox`)
  const addMessage = document.querySelector('#inbox');
  addMessage.insertAdjacentHTML('beforeend', `<div class="row message unread"><div class="col-3">${newMessage().sender}</div><div class="col-9">${newMessage().subject}</div></div>`);
};

const updateUnreadCount = () => {
  const unreadCount = document.querySelectorAll('.message.unread').length;
  document.getElementById('count').innerText = `(${unreadCount})`;
  document.title = `(${unreadCount}) Fake Inbox`;
};

const refresh = () => {
  // TODO: Implement the global refresh logic. If there is a new message,
  //       append it to the DOM. Update the unread counter in title as well.
  if (hasNewMessage()) {
    appendMessageToDom(newMessage());
    updateUnreadCount();
  }
};

















// Do not remove these lines:
document.addEventListener("DOMContentLoaded", () => {
  setInterval(refresh, 1000); // Every 1 second, the `refresh` function is called.
});

module.exports = { hasNewMessage, newMessage };
