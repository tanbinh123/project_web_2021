import React from "react";
import { useRouteMatch } from "react-router";
function Socket(props) {
  const { path } = useRouteMatch();
  console.log("socket", "RUn");
  return (
    <div>
     
    </div>
  );
}

export default Socket;
