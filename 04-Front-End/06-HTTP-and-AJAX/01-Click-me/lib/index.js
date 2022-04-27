const displayAlertOnButtonClick = () => {
  // TODO: Select the big green button
  const button = document.querySelector('button');
  // TODO: Bind the `click` event to the button
  // TODO: On click, display `Thank you!` in a JavaScript alert!
  button.addEventListener('click', (event) => {
    alert('Thank You!');
  });
};

displayAlertOnButtonClick(); // Do not remove!
