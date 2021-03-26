import { Avatar, Grid } from "@material-ui/core";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import CardMedia from "@material-ui/core/CardMedia";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import PropTypes from "prop-types";
import React, { useEffect, useState } from "react";
import ButtonSmall from "../Button/ButtonSmall";
import Rating from "@material-ui/lab/Rating";

const useStyles = makeStyles((theme) => ({
  root: {
    // maxWidth: 345,
    "&:hover": {
      boxShadow:
        "0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 5px 9px 0px rgb(0 0 0 / 14%), 0px 1px 3px 0px rgb(0 0 0 / 12%)",
    },
  },
  CardActionArea: {
    "&:hover>img": {
      transform: " scale(1.1)",
      transitionDuration: "0.5s",
      transitionProperty: "transform",
    },
  },
  CardActionArea__Content: {
    minHeight: 140,
  },
  avatar: {
    width: 35,
    height: 35,
    float: "left",
  },
  name: {
    fontSize: 17,
    marginLeft: 10,
    lineHeight: "30px",
  },
  money: {
    fontSize: 20,
    fontWeight: 600,
  },
  row: {
    display: "block",
  },
  title: { fontSize: 22, fontWeight: 600 },
}));
CardCourse.propTypes = {
  title: PropTypes.string,
  description: PropTypes.string,
  image: PropTypes.string,
  avatar: PropTypes.string,
  nameAuthor: PropTypes.string,
};

CardCourse.defaultProps = {
  title: "",
  description: "",
  image: "",
  avatar: "",
  nameAuthor: "",
};
export default function CardCourse(props) {
  const classes = useStyles();
  const { title, description, image, avatar, nameAuthor, rateStar } = props;
  const [tmpDescription, setTmpDescription] = useState(description);
  useEffect(() => {
    (() => {
      if (description.length > 140) {
        setTmpDescription(description.slice(0, 140) + "...");
      }
    })();
  }, []);
  function handleExpand() {
    if (tmpDescription.length < 144) {
      setTmpDescription(description);
    } else {
      setTmpDescription(description.slice(0, 140) + "...");
    }
  }
  return (
    <Card className={classes.root}>
      <CardActionArea className={classes.CardActionArea}>
        <CardMedia
          className={classes.image}
          component="img"
          height="170"
          image={image}
        />
        <CardContent className={classes.CardActionArea__Content}>
          <Typography
            gutterBottom
            variant="h5"
            component="h2"
            className={classes.title}
          >
            {title}
          </Typography>
          <Typography
            variant="body2"
            color="textSecondary"
            component="p"
            onClick={handleExpand}
          >
            {tmpDescription}
          </Typography>
        </CardContent>
      </CardActionArea>
      <CardActions>
        <Grid container spacing={2}>
          <Grid item xl={12} lg={12}>
            <Avatar src={avatar} className={classes.avatar}></Avatar>
            <span className={classes.name}>{nameAuthor}</span>
          </Grid>
          <Grid item xl={12} lg={12}>
            <Rating name="read-only" value={rateStar} readOnly />
          </Grid>
          <Grid item xl={9} lg={7}>
            <span className={classes.money}>2,000,000 VNĐ</span>
          </Grid>
          <Grid item xl={3} lg={5}>
            <ButtonSmall title="Xem Thêm" />
          </Grid>
        </Grid>
      </CardActions>
    </Card>
  );
}
