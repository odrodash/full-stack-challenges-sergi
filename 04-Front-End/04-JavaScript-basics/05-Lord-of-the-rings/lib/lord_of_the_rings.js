const isGood = (soldierType) => {
  // TODO: return `true` if the soldierType is Good.
  // Hint: Hobbits, Elves, Dwarves and Eagles are Good
  const good = ['Hobbits', 'Elves', 'Dwarves', 'Eagles'];
  return good.includes(soldierType);
};

const buildSoldierObject = (battlefield) => {
  // TODO: Given a battlefield (String), return an object of forces.
  const hash = {};
  const object = battlefield.split(',');
  object.forEach((content) => {
    const value = content.split(':');
    hash[value[0]] = +value[1];
  });
  return hash;
};

const whoWinsTheWar = (battlefield) => {
  // TODO: Based on the battlefield's description (it's a String), return "Good", "Evil" or "Tie".
  const teams = { good: 0, evil: 0 };
  const soldiers = Object.entries(buildSoldierObject(battlefield));

  soldiers.forEach((soldier) => {
    if (isGood(soldier[0])) {
      teams.good += soldier[1];
    } else {
      teams.evil += soldier[1];
    }
  });

  let result = "";
  if (teams.good === teams.evil) {
    result = "Tie";
  } else if (teams.good > teams.evil) {
    result = "Good";
  } else if (teams.good < teams.evil) {
    result = "Evil";
  } else {
    result = "Tie";
  }
  return result;
};

module.exports = { whoWinsTheWar, buildSoldierObject, isGood }; // Do not remove this line
