const faker = require("faker");

function generateUser() {
  const id = faker.random.uuid();
  const name = faker.name.findName();
  const user = {
    id: id,
    name: name,
  };
  return user;
}
module.exports = generateUser;
