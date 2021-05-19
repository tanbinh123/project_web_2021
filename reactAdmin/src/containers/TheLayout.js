import React from "react";
import { TheContent, TheFooter, TheSidebar } from ".";
import TheHeader from "./TheHeader";

function TheLayout(props) {
  return (
    <div className="c-app c-default-layout">
      <TheSidebar />
      <div className="c-wrapper">
        <TheHeader />
        <div className="c-body">
          <TheContent />
        </div>
        <TheFooter />
      </div>
    </div>
  );
}

export default TheLayout;
