// TODO: React to a click on the button!
const audio = new Audio('../sound.mp3');

const button = document.querySelector('#clickme');
button.addEventListener('click', (Event) => {
  button.classList = 'disabled';
  button.innerText = 'Bingo!';
  audio.play();
});
