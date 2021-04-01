import { Grid, makeStyles } from "@material-ui/core";
import React from "react";
import { Route, Switch } from "react-router-dom";
import Blank from "./features/Blank";
import PaymentFeatures from "./features/Payment";
import "./index.css";
App.propTypes = {};
const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  paper: {
    textAlign: "center",    
    border:1,
    height: 500,
    width: "100%",
  },
}));

function App(props) {
  const classes = useStyles();
  return (
    <div>
      <Grid container className={classes.root} justify="flex-start" spacing={0}>
        <Grid item xs={12}>
          <Grid container justify="flex-start" spacing={0}>
            <Grid item xs={1}>
              {/* <Paper className={classes.paper} /> */}
              <Switch>
                <Route path="/payment"  >
                  <PaymentFeatures className={classes.paper}/>
                </Route>
                <Route path="/" >
                  <Blank className={classes.paper}  />
                </Route>
              </Switch>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
      
    </div>
  );
}

export default App;
