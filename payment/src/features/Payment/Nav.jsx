import React from "react";
import { Link, useRouteMatch } from "react-router-dom";

export default function Nav() {
  const { path } = useRouteMatch();
  return (
    <div>
      <Link to={`${path}/Momo`}>Momo</Link>
      <br />
      <Link to={`${path}/Paypal`}>Paypal</Link>
    </div>
  );
}

