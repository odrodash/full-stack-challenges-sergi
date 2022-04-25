const sumOfNegative = (numbers) => {
  // TODO: You are getting a `numbers` array. Return the sum of **negative** numbers only.
  let sumNegative = 0;
  if (numbers) {
    numbers.forEach((number) => {
      if (number < 0) {
        sumNegative += number;
      }
    });
  }
  return sumNegative;
};

module.exports = sumOfNegative; // Do not remove.
