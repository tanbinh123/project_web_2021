import React from "react";
import PropTypes from "prop-types";
import { Container, makeStyles } from "@material-ui/core";
const useStyles = makeStyles((theme) => {});
LoginFeatures.propTypes = {};

function LoginFeatures(props) {
  const classes = useStyles();
  return (
    <div className={classes.root}>
      <Container maxWidth="sm">form login</Container>
    </div>
  );
}

export default LoginFeatures;
