export function DateToString(date) {
  const date1 = new Date(date);
  return `${date1.getDate()}/${date1.getMonth() + 1}/${date1.getFullYear()}`;
}
export function isEmpty(obj) {
  if (obj === '') {
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
export function convertVND(int) {
  return int
    .toLocaleString('vi-VI', {
      style: 'currency',
      currency: 'VND',
    })
    .replaceAll('.', ',');
}

export function toDate(ddMMyyyy) {
  if (!isEmpty(ddMMyyyy)) {
    const tmp = ddMMyyyy.split('/');
    return new Date(tmp[2], tmp[1] - 1, tmp[0]);
  }
}
export function validateEmail(email) {
  const re =
    /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(String(email).toLowerCase());
}
