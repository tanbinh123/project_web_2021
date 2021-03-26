let faker = require("faker");

function generateEmployees(number) {
  let employees = [];
  for (let id = 1; id <= number; id++) {
    let firstName = faker.name.firstName();
    let lastName = faker.name.lastName();
    let email = faker.internet.email();
    employees.push({
      id: id,
      first_name: firstName,
      last_name: lastName,
      email: email,
    });
  }
  return employees;
}
module.exports = generateEmployees;
