// TODO: Autocomplete the input with AJAX calls.

const input = document.querySelector('#search');
const ul = document.querySelector('#results');

input.addEventListener("keyup", (event) => {
  ul.innerHTML = "";
  fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${input.value}`)
    .then(response => response.json())
    .then((data) => {
      data.words.forEach((word) => {
        const li = `<li><a href="#" class="decoration">${word}</a></li>`;
        ul.insertAdjacentHTML("beforeend", li);
      });
    });
});
