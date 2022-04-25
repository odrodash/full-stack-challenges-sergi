const valid = (email) => {
  // TODO: return true if the `email` string has the right pattern!
  const emailValid = /^(([^<>()[\].,;:\s@"]+(\.[^<>()[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/i;
  if (emailValid.test(email)) {
    return true;
  }
  if (emailValid.test(email) === false) {
    return false;
  }
  return true;
};

module.exports = valid; // Do not remove.
