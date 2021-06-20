export function DateToString(date) {
  const date1 = new Date(date);
  return `${date1.getDate()}/${date1.getMonth() + 1}/${date1.getFullYear()}`;
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
  } else if (obj === {}) {
    return true;
  } else {
    return false;
  }
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
