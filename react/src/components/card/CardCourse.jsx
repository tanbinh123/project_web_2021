import { Avatar, Grid } from "@material-ui/core";
import Card from "@material-ui/core/Card";
import CardActionArea from "@material-ui/core/CardActionArea";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import CardMedia from "@material-ui/core/CardMedia";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import { PeopleAlt } from "@material-ui/icons";
import Rating from "@material-ui/lab/Rating";
import PropTypes from "prop-types";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import ButtonSmall from "../Button/ButtonSmall";
import { colorBlack1, colorBlack2 } from "../color/color";
import { convertVND } from "../tools/Tools";

const useStyles = makeStyles((theme) => ({
  root: {
    // maxWidth: 345,
    "&:hover": {
      boxShadow:
        "0px 2px 1px -1px rgb(0 0 0 / 20%), 0px 5px 9px 0px rgb(0 0 0 / 14%), 0px 1px 3px 0px rgb(0 0 0 / 12%)",
    },
    // height: 500,
  },
  CardActionArea: {
    "&:hover>img": {
      transform: " scale(1.1)",
      transitionDuration: "0.5s",
      transitionProperty: "transform",
    },
  },
  CardActionArea__Content: {
    minHeight: 200,
  },
  linkAuthor: {
    textDecoration: "none",
  },
  avatar: {
    width: 35,
    height: 35,
    float: "left",
  },
  name: {
    fontSize: 18,
    marginLeft: 10,
    lineHeight: "35px",
    fontWeight: 600,
    color: colorBlack2,
  },
  money: {
    display: "flex",
    height: "100%",
    alignItems: "center",
    "&>span": {
      fontSize: 20,
      fontWeight: 600,
      color: "#e74c3c",
    },
  },
  row: {
    display: "block",
  },
  title: { fontSize: 22, fontWeight: 600, color: colorBlack2 },
  button: {
    display: "flex",
    width: "100%",
    justifyContent: "flex-end",
    "& > a": {
      textDecoration: "none",
    },
  },
  bought: {
    display: "flex",
    justifyContent: "flex-end",
    "&>span": {
      display: "flex",
    },
    "& .icon": {
      fontSize: 22,
      color: colorBlack1,
    },
    "& .number": {
      fontSize: 20,
      marginLeft: 10,
      color: colorBlack1,
    },
  },
}));
CardCourse.propTypes = {
  id: PropTypes.string,
  title: PropTypes.string,
  description: PropTypes.string,
  image: PropTypes.string,
  avatar: PropTypes.string,
  nameAuthor: PropTypes.string,
  bought: PropTypes.number,
  price: PropTypes.number,
  rateStar: PropTypes.number,
};

CardCourse.defaultProps = {
  id: "",
  title: "",
  description: "",
  image: "",
  avatar: "",
  nameAuthor: "",
  bought: 0,
  price: 0,
  rateStar: 0,
};
export default function CardCourse(props) {
  const classes = useStyles();
  const {
    id,
    title,
    description,
    image,
    avatar,
    nameAuthor,
    rateStar,
    bought,
    price,
  } = props;
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
  console.log(avatar);
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
          <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
            <Link to="/" className={classes.linkAuthor}>
              <Avatar src={avatar} className={classes.avatar}></Avatar>
              <span className={classes.name}>{nameAuthor}</span>
            </Link>
          </Grid>
          <Grid item xl={9} lg={7} md={7} sm={7} xs={7}>
            <Rating
              name="half-rating-read"
              value={rateStar}
              precision={0.5}
              readOnly
            />
          </Grid>
          <Grid item xl={3} lg={5} md={5} sm={5} xs={5}>
            <div className={classes.bought}>
              <span title="Người đã mua">
                <PeopleAlt className="icon" />
                <span className="number">{bought}</span>
              </span>
            </div>
          </Grid>
          <Grid item xl={9} lg={7} md={7} sm={7} xs={7}>
            <div className={classes.money}>
              <span>{convertVND(price)}</span>
            </div>
          </Grid>
          <Grid item xl={3} lg={5} md={5} sm={5} xs={5}>
            <div className={classes.button}>
              <Link to={`/course/${id}`}>
                <ButtonSmall title="Xem Thêm" />
              </Link>
            </div>
          </Grid>
        </Grid>
      </CardActions>
    </Card>
  );
}
