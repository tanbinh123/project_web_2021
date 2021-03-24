import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import CardMedia from "@material-ui/core/CardMedia";
import Button from "@material-ui/core/Button";
import Typography from "@material-ui/core/Typography";
import { Avatar } from "@material-ui/core";

const useStyles = makeStyles((theme) => ({
  root: {
    maxWidth: 345,
    "&:hover": {
      boxShadow:
        "0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 5px 9px 0px rgb(0 0 0 / 14%), 0px 1px 3px 0px rgb(0 0 0 / 12%)",
    },
  },
  CardActionArea: {
    "&:hover>div": {
      backgroundColor: "white",
    },
    "&:hover>img": {
      transform: " scale(1.1)",
      transitionDuration: "0.5s",
      transitionProperty: "transform",
    },
  },
}));

export default function CardCourse() {
  const classes = useStyles();

  return (
    <Card className={classes.root}>
      <CardActionArea className={classes.CardActionArea}>
        <CardMedia
          className={classes.image}
          component="img"
          alt="Contemplative Reptile"
          height="170"
          image="/assets/images/33ra.jpg"
          title="Contemplative Reptile"
        />
        <CardContent>
          <Typography gutterBottom variant="h5" component="h2">
            Lizard
          </Typography>
          <Typography variant="body2" color="textSecondary" component="p">
            Lizards are a widespread group of squamate reptiles, with over 6,000
            species, ranging across all continents except Antarctica
          </Typography>
        </CardContent>
      </CardActionArea>
      <CardActions>
        <Avatar></Avatar>
        <span>Thành Sang</span>
        <span>Xem Tiếp</span>
      </CardActions>
    </Card>
  );
}
