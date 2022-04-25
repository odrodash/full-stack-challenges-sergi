const listItem = (content) => {
  // TODO: return the proper <li> HTML tag with its content (as a string)
  if (content === "") {
    const tagItem2 = `<li class="list-group-item">${content}</li>`;
    return tagItem2;
  }
  if (content) {
    const tagItem = `<li class="list-group-item">${content}</li>`;
    return tagItem;
  }
  return true;
};

const unorderedList = (items) => {
  // TODO: return the proper <ul> markup (as a string)
  let resultado = "";
  items.forEach((item) => {
    resultado += `\n  ${listItem(item)}`;
  });
  return `<ul class="list-group">${resultado}\n</ul>`;
};

module.exports = { listItem, unorderedList }; // Do not remove.
