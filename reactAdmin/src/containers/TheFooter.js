import React from "react";
import { CFooter } from "@coreui/react";

const TheFooter = () => {
  return (
    <CFooter fixed={false}>
      <div>
        <span className="mr-1">Backend by</span>
        <a href="https://www.facebook.com/Hearter.Zouest" target="_blank">
          Lê Tấn Hoàng
        </a>
      </div>
      <div className="mfs-auto">
        <span className="mr-1">Frontend by</span>
        <a href="https://www.facebook.com/nguyenhuythanhsang" target="_blank">
          Nguyễn Huy Thành Sang
        </a>
      </div>
    </CFooter>
  );
};

export default React.memo(TheFooter);
