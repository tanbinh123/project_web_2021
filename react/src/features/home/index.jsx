import { Container, CssBaseline, makeStyles } from "@material-ui/core";
import React from "react";
import RecipeReviewCard from "../../components/card";

const useStyles = makeStyles((theme) => ({
  root: {},
  bgHome: {
    minHeight: "100vh",
    backgroundImage: `url(${
      process.env.PUBLIC_URL + "/assets/images/klee.jpg"
    })`,
    backgroundPosition: "center",
    backgroundRepeat: "no-repeat",
    backgroundSize: "cover",
  },
  bgDark: {
    minHeight: "100vh",
    backgroundColor: "rgb(0,0,0,0.5)",
  },
}));

function Home(props) {
  const classes = useStyles();
  return (
    <div className={classes.root}>
      <CssBaseline />
      <div className={classes.bgHome}>
        <div className={classes.bgDark}></div>
      </div>
      <Container maxWidth="lg">
        <div className="middle">
          <RecipeReviewCard />
        </div>
      </Container>
    </div>
  );
}

export default Home;
