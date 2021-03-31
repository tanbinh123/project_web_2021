const fs = require("fs");
const generateCourses = require("./genarate-data/course");
const generateCourseDetail = require("./genarate-data/courseDetail");
///////////////////////////////////////////////////////////////
const generateEmployees = require("./genarate-data/employees");
const generateProducts = require("./genarate-data/products");
const generateUser = require("./genarate-data/user");

//////////////////////////////////////////////////////////////
(() => {
  //generater data
  // const listEmployees = generateEmployees(1);
  // const lisPproducts = generateProducts(1);
  // const dataUser = generateUser();
  const listCourses = generateCourses(100);
  const courseDetail = generateCourseDetail(1);

  //add list to obj
  const db = {
    // employees: listEmployees,
    // products: lisPproducts,
    // user: dataUser,
    courses: listCourses,
    courseDetail: courseDetail,
  };
  //write data to file db.json
  fs.writeFile("db.json", JSON.stringify(db, null, "\t"), () => {
    console.log("Write Success");
  });
})();
// fs.writeFileSync("db.json", JSON.stringify(dataProducts, null, "\t"));
