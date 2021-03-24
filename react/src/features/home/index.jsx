import { Container, CssBaseline, makeStyles } from "@material-ui/core";
import React from "react";
import CardCourse from "../../components/card/CardCourse";
import Header from "../../components/header";

const useStyles = makeStyles((theme) => ({
  root: {},
  bgHome: {
    minHeight: "100vh",
    background:
      'linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url("/assets/images/klee.jpg")',
    backgroundPosition: "center",
    backgroundRepeat: "no-repeat",
    backgroundSize: "cover",
  },
}));

function Home(props) {
  const classes = useStyles();
  return (
    <div className={classes.root}>
      <Header />
      <CssBaseline />
      <div className={classes.bgHome}></div>
      <Container maxWidth="lg">
        <div className="middle">
          <CardCourse />
        </div>
      </Container>
    </div>
  );
}

export default Home;
