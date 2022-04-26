/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */

const { doc } = require("mocha/lib/reporters");

// INSTRUCTIONS - PLEASE READ!!
// Here are some challenges. Solve them from top to bottom

// **Each time** you complete a challenge, please commit and push!
// This is a good practice. Each time you make some progress in software
// development, you want to save a snapshot.


module.exports = function runChallenges(check) {
  // Ex 1. Read what's written in the email input
  //       Make the function getEmail() return it

  let getEmail = () => {
    // TODO: return the email
    const email = document.querySelector('#email');
    return email.value;
  };

  // /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const borisesEmail = getEmail();

  // Ex 2. Change the content of the email input by writing your own email address
  const email2 = document.querySelector('#email');
  email2.value = 'sergio@hotmail.com';

  // Ex 3. Replace the email hint (next to the input) with 'This is my email now'
  //       The text should be emphasized using a <strong> tag

  const emailHint = document.querySelector('#email-hint');
  emailHint.innerText = 'This is my email now';
  emailHint.innerHTML = '<strong>This is my email now</strong>';
  // Ex 4. Add the .blue CSS class to the th elements
  const blue = document.querySelectorAll('th');
  blue.forEach((clase) => {
    clase.classList = 'blue';
  });


  // Ex 5. Count the number of table body rows there are
  //       Make the function teamCount() return it
  const teamCount = () => {
    // TODO: return the number of teams
    const teams = document.querySelectorAll('.teams');
    const count = teams.length;
    return count;
  };

  // /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const teamCountBeforeAddition = teamCount();

  // Ex 6. Say there is a 15th team added to the table.
  //       Add a row at the bottom, this new team should have zero points.
  const table = document.querySelector('tbody');
  table.insertAdjacentHTML('beforeend', '<tr class="teams"><td>15</td><td>Sergio teams winner perro </td><td>0</td></tr>');


  // Ex 7. Write some code to sum all points given to all teams
  //       Make the function summarizePoints() return it
  const summarizePoints = () => {
    // TODO: return the sum
    let sum = 0;
    const teams = document.querySelectorAll('.sum');
    teams.forEach((team) => {
      sum += parseInt(team.innerText, 10);
    });
    return sum;
  };


  // Ex 8. Change the background color of all `<th>` cells to #DDF4FF

  let background = document.querySelectorAll('th');
  background.forEach((th) => {
    th.style.background = "rgb(221, 244, 255)";
  });
  // Ex 9. Remove the "Email:" label from the DOM
  const data = document.querySelector("#data div");
  data.firstElementChild.remove();
  // Checking exercise answers. DO NOT MODIFY THIS LINE
  check(borisesEmail, teamCountBeforeAddition, summarizePoints());
};
