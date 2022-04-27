// TODO: write your code here!
const hoverActive = document.querySelectorAll('.clickable');

const toggleActiveClass = ((item) => {
  item.addEventListener('click', (event) => {
    item.classList.toggle('active');
  });
});

hoverActive.forEach((item) => {
  toggleActiveClass(item);
});
