export function DateToString(date) {
  const date1 = new Date(date);
  return `${date1.getDate()}/${date1.getMonth() + 1}/${date1.getFullYear()}`;
}
export function isEmpty(obj) {
  if (obj == "") return true;
  if (obj == null) return true;
  if (Array.isArray(obj)) {
    if (obj.length == 0) return true;
  }
  for (var prop in obj) {
    if (obj.hasOwnProperty(prop)) {
      return false;
    }
  }
  return JSON.stringify(obj) === JSON.stringify({});
}

export function convertVND(int) {
  return int
    .toLocaleString("vi-VI", {
      style: "currency",
      currency: "VND",
    })
    .replaceAll(".", ",");
}

export function toDate(ddMMyyyy) {
  const tmp = ddMMyyyy.split("/");
  return new Date(tmp[2], tmp[1] - 1, tmp[0]);
}
