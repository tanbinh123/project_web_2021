let faker = require("faker");

function generateProducts(number) {
  let products = [];
  for (let id = 1; id <= number; id++) {
    let name = faker.commerce.productName();
    let price = faker.commerce.price();
    let description = faker.commerce.productDescription();
    products.push({
      id: id,
      name: name,
      price: price,
      description: description,
    });
  }
  return products;
}
module.exports = generateProducts;
