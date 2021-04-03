import {
  Accordion,
  AccordionDetails,
  AccordionSummary,
  Grid,
  makeStyles
} from "@material-ui/core";
import ExpandMoreIcon from "@material-ui/icons/ExpandMore";
import React from "react";
import { Link } from "react-router-dom";
import {
  colorBlack1,
  colorBlack2,

  colorOrange2,
  colorWhite1
} from "../color/color";

const useStyles = makeStyles((theme) => ({
  heading: {
    display: "flex",
    flexFlow: "row nowrap",
    flex: "1 1 auto",
    justifyContent: "space-between",
    "& > div > .heading__title": {
      fontSize: 18,
      fontWeight: 600,
      color: colorBlack2,
    },

    "& > div > .heading__lesson": {
      color: colorBlack1,

      [theme.breakpoints.down("sm")]: {
        float: "right",
        marginTop: 4,
      },
    },
    "& > div > .heading__time": {
      color: colorBlack1,
      display: "flex",
      [theme.breakpoints.down("sm")]: {
        display: "none",
      },
    },
  },
  AccordionSummary: {
    background: colorWhite1,
    marginTop: 10,
  },
  AccordionDetails: {
    display: "flex",
    flexFlow: "column nowrap",
    padding: "0px",
    background: "rgba(236, 240, 241,0.5)",
  },
  lesson: {
    padding: "10px",
    boxShadow: "0px 1px #7f8c8d",
    "& > a": {
      textDecoration: "none",
      color: colorBlack2,
      "&:hover": {
        color: colorOrange2,
      },
    },
    "&>.lesson__time": {
      float: "right",
      marginRight: "8%",
    },
  },
}));
ItemAccordion.propTypes = {};
function ItemAccordion(props) {
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
              <span className="heading__title">
                Phần 1: Phương pháp học tập
              </span>
            </Grid>
            <Grid item xl={2} lg={2} md={2} sm={2} xs={2}>
              <span className="heading__lesson">2 Bài</span>
            </Grid>
            <Grid item xl={2} lg={1} md={1}>
              <span className="heading__time">30:30</span>
            </Grid>
          </div>
        </Grid>
      </AccordionSummary>
      <AccordionDetails className={classes.AccordionDetails}>
        <div className={classes.lesson}>
          <Link to="/">
            <span>1. 8 lời khuyên giúp học lập trình tại F8 hiệu quả hơn!</span>
          </Link>
          <span className="lesson__time">30:30</span>
        </div>
        <div className={classes.lesson}>
          <Link to="/">
            <span>1. 8 lời khuyên giúp học lập trình tại F8 hiệu quả hơn!</span>
          </Link>
          <span className="lesson__time">30:30</span>
        </div>
      </AccordionDetails>
    </Accordion>
  );
}

export default ItemAccordion;
