import React, { useEffect } from "react";
import { Route, Switch, useRouteMatch } from "react-router-dom";
import Nav from "./Nav";
import Momo from "./Pages/Momo";
import Paypal from "./Pages/Paypal";
import api from "../../api/courseApi";
PaymentFeatures.propTypes = {};
export default function PaymentFeatures(props) {
  const { path } = useRouteMatch();
  const {className}=props;
  console.log("test 1");

  useEffect(() => {
    console.log('1');
    (async () => {
      try {
        const my = await api.getAll();
       
         console.log('hoang',my);
      } catch (error) {
        console.log(error);
      }
      
    })();
  }, []);

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


