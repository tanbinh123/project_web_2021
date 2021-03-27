export function isEmpty(obj) {
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
