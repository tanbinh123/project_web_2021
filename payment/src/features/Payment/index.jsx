import React from "react";
import { Route, Switch, useRouteMatch } from "react-router-dom";
import Nav from "./Nav";
import Momo from "./Pages/Momo";
import Paypal from "./Pages/Paypal";

PaymentFeatures.propTypes = {};
export default function PaymentFeatures(props) {
  const { path } = useRouteMatch();
  const {className}=props;
  console.log(className);
  return (
    <>
      <Switch>
        <Route path={`${path}/Momo`} component={Momo} />
        <Route path={`${path}/Paypal`} component={Paypal}/>
        <Route path={`${path}`} component={Nav}/>
      </Switch>
     
    </>
  );
}


