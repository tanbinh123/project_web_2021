import { Grid, makeStyles } from "@material-ui/core";
import PropTypes from "prop-types";
import React from "react";
import CardCourse from "../../../../../components/card/CardCourse";

RightCoures.propTypes = {
  dataCourse: PropTypes.array,
};
RightCoures.defaultProps = {
  dataCourse: [],
};
const useStyles = makeStyles((theme) => ({
  root: {
    padding: "20px",
  },
}));
function RightCoures(props) {
  const classes = useStyles();
  const { dataCourse } = props;
  return (
    <div className={classes.root}>
      <Grid container spacing={3}>
        {Array.from(dataCourse)
          .filter((f) => f.deleted === false)
          .map((x, index) => (
            <Grid key={index} item xl={4} lg={4} md={6} sm={6} xs={12}>
              <CardCourse
                id={x.id + ""}
                title={x.title}
                description={x.description}
                image={x.thumbnail}
                avatar={x.imgAvatar}
                nameAuthor={x.nameAuthor}
                rateStar={x.rateStar}
                bought={x.bought}
                price={x.price}
              />
            </Grid>
          ))}
      </Grid>
    </div>
  );
}

export default RightCoures;
