let batch = 1; // change to your own batch id
const baseUrl = "https://wagon-chat.herokuapp.com/:channel/messages";

// Your turn to code!

const refresh = document.querySelector('#refresh');
const h1 = document.querySelector('h1');
let count = 0;

const messagesGet = (item) => {
  fetch(baseUrl)
    .then(response => response.json())
    .then((data) => {
      data.messages.forEach((message) => {
        count += 1;
        h1.innerText = `CHAT-ROOM (${batch += 1})`;
        const insert = `<li>${message.content} (posted <span class="date">${count} minutes ago</span>) by ${message.author}</li>`;
        item.insertAdjacentHTML('afterbegin', insert);
      });
    });
};

const messagePost = () => {
  const message1 = document.getElementById("your-message").value;
  const author1 = document.getElementById("your-name").value;
  fetch(baseUrl, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ author: author1, content: message1 })
  }).then(response => response.json())
    .then((data) => {
      console.log(data);
    });
};

const form = document.querySelector("#comment-form");
const li = document.querySelector('.list-unstyled');

form.addEventListener('submit', (event) => {
  event.preventDefault();
  messagePost();
  messagesGet(li);
});
