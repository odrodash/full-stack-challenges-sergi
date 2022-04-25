const evenOrOdd = (number) => {
  // TODO: this should return "even" if the number is even, "odd" otherwise
  if ((number % 2 === 0)) {
    return 'even';
  }
  if ((number % 2 === 1)) {
    return 'odd';
  }
  return true;
};

module.exports = evenOrOdd; // Do not remove. We need this for the spec to know about your method.
