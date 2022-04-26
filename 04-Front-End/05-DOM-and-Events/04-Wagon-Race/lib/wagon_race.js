// TODO: write your code here
const player1 = document.querySelectorAll('#player1-race td');
const player2 = document.querySelectorAll('#player2-race td');
const audioWinner = new Audio('../win.mp3');

let race1 = 0;
let race2 = 0;

const pressKey = (k) => {
  if (k.key === "q") {
    race1 += 1;
    player1[race1].classList.add('active');
    player1[race1 - 1].classList.remove('active');
  } else if (player1[race1].classList[0] === 'finish') {
    audioWinner.play();
    alert("Player 1 is Winner!");
    window.location.reload();
  }
  if (k.key === "m") {
    race2 += 1;
    player2[race2].classList.add('active');
    player2[race2 - 1].classList.remove('active');
  } else if (player2[race2].classList[0] === 'finish') {
    audioWinner.play();
    alert("Player 2 is Winner!");
    window.location.reload();
  }
  return true;
};

window.addEventListener('keyup', pressKey, false);
