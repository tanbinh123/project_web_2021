import {
  Accordion,
  AccordionDetails,
  AccordionSummary,
  Grid,
  makeStyles,
} from "@material-ui/core";
import ExpandMoreIcon from "@material-ui/icons/ExpandMore";
import React, { useEffect } from "react";
import { Link, useRouteMatch } from "react-router-dom";
import PropTypes from "prop-types";
import "./IteamALecture.css";

const useStyles = makeStyles((theme) => ({
  heading: {
    display: "flex",
    flexFlow: "row nowrap",
    flex: "1 1 auto",
    justifyContent: "space-between",
    "& > div > .heading__title": {
      fontSize: 16,
      fontWeight: 600,
      color: "var(--colorBlack2)",
    },

    "& > div > .heading__lesson": {
      color: "var(--colorBlack1)",

      [theme.breakpoints.down("sm")]: {
        float: "right",
        marginTop: 4,
      },
    },
    "& > div > .heading__time": {
      color: "var(--colorBlack1)",
      display: "flex",
      [theme.breakpoints.down("sm")]: {
        display: "none",
      },
    },
  },
  AccordionSummary: {
    background: "var(--colorWhite1)",
    // marginTop: 10,
  },
  AccordionDetails: {
    display: "flex",
    flexFlow: "column nowrap",
    padding: "0px",
    background: "rgba(236, 240, 241,0.5)",
  },
  lesson: {
    display: "flex",
    justifyContent: "space-between",
    padding: "10px",
    // boxShadow: "0px 1px #7f8c8d",
    "& > a": {
      textDecoration: "none",
      color: "var(--colorBlack2)",
      "&:hover": {
        color: "var(--colorOrange2)",
        transition: "all 0.1s linear",
      },
    },
    "&>.lesson__time": {
      float: "right",
      marginRight: "8%",
    },
  },
}));
ItemAccordionLecture.propTypes = {
  id: PropTypes.number,
  title: PropTypes.string,
  lessons: PropTypes.array,
};
ItemAccordionLecture.defaultProps = {
  id: 0,
  title: "",
  lessons: [],
};
function ItemAccordionLecture(props) {
  const { url } = useRouteMatch();
  const { id, title, lessons, indexLecture } = props;
  const classes = useStyles();

  return (
    <Accordion defaultExpanded={true}>
      <AccordionSummary
        className={classes.AccordionSummary}
        expandIcon={<ExpandMoreIcon />}
        aria-controls="panel1a-content"
        id="panel1a-header"
      >
        <Grid item xl={12} lg={12} md={12} sm={12} xs={12}>
          <div className={classes.heading}>
            <Grid item xl={8} lg={9} md={10} sm={10} xs={10}>
              <span className="heading__title">Phần {title}</span>
            </Grid>
            <Grid item xl={2} lg={2} md={2} sm={2} xs={2}>
              <span className="heading__lesson">{lessons.length} Bài</span>
            </Grid>
            <Grid item xl={2} lg={1} md={1}>
              <span className="heading__time">30:30</span>
            </Grid>
          </div>
        </Grid>
      </AccordionSummary>
      <AccordionDetails className={classes.AccordionDetails}>
        {Array.from(lessons).map((item, index) => (
          <div key={index} className={classes.lesson}>
            <Link to={`${url}/lecture/${item.video?.id}`}>
              <span>
                {indexLecture + index + 1}. {item.description}
              </span>
            </Link>
            <span className="lesson__time">30:30</span>
          </div>
        ))}
      </AccordionDetails>
    </Accordion>
  );
}

export default ItemAccordionLecture;
