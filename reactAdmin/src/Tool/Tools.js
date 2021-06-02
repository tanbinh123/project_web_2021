export function DateToString(date) {
  const date1 = new Date(date);
  return `${date1.getDate()}/${date1.getMonth() + 1}/${date1.getFullYear()}`;
}
export function isEmpty(data) {
  if (data === "") return true;
  if (data === null) return true;
  if (data === undefined) return true;
  if (data == null) return true;
  return false;
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
