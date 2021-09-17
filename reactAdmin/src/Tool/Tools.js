export function DateToString(dateString) {
  // const date1 = new Date(dateString);

  var dateParser = /(\d{2})\/(\d{2})\/(\d{4}) (\d{2}):(\d{2}):(\d{2})/;
  var match = dateString.match(dateParser);
  var date = new Date(
    match[3], // year
    match[2] - 1, // monthIndex
    match[1], // day
    match[4], // hours
    match[5], // minutes
    match[6] //seconds
  );
  //return `${date1.getDate()}/${date1.getMonth() + 1}/${date1.getFullYear()}`;
  return `${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`;
}
export function isEmpty(obj) {
  if (obj === "") {
    return true;
  } else if (obj === null) {
    return true;
  } else if (obj === undefined) {
    return true;
  } else if (Array.isArray(obj)) {
    if (obj.length === 0) return true;
  } else if (isEmptyObj(obj)) {
    return true;
  } else {
    return false;
  }
}
function isEmptyObj(obj) {
  for (var prop in obj) {
    if (obj.hasOwnProperty(prop)) {
      return false;
    }
  }
  return JSON.stringify(obj) === JSON.stringify({});
}
export function convertVND(value) {
  return new Intl.NumberFormat("vi-VI", {
    style: "currency",
    currency: "VND",
  })
    .format(value)
    .replaceAll(".", ",");
}

export function toDate(ddMMyyyy) {
  const tmp = ddMMyyyy.split("/");
  return new Date(tmp[2], tmp[1] - 1, tmp[0]);
}
export function DateToString2(dateString) {
  const date1 = new Date(dateString);

  return `${date1.getDate()}/${date1.getMonth() + 1}/${date1.getFullYear()}`;
}
