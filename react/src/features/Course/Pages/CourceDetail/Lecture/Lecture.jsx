import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import { useParams, useRouteMatch } from "react-router";
import CSSLecture from "./CSSLecture";
import { Box, Container, Dialog, Grid, Paper } from "@material-ui/core";
import HeaderLecture from "../../../../../components/HeaderLecture/HeaderLecture";
import courseApi from "../../../../../api/courseApi";
import { Link } from "react-router-dom";
import ListAccordion from "./ListLecture/ListAccordion";
import classNames from "classnames";
import { stringify, stringifyUrl } from "query-string";
import VideoLecture from "./ListLecture/VideoLecture";

Lecture.propTypes = {};

function Lecture(props) {
  const classes = CSSLecture();
  const { idLecture } = useParams();
  const { url } = useRouteMatch();
  const idCourse = url.slice(
    url.indexOf("/course/") + 8,
    url.indexOf("/lecture")
  );
  const [course, setCourse] = useState({});
  const [src, setSrc] = useState();
  const [showList, setShowList] = useState(false);
  const handleToggleList = () => {
    setShowList(!showList);
  };
  useEffect(() => {
    (async () => {
      try {
        const res = await courseApi.check({ idCourse: idCourse });
        console.log(res);

        setCourse(res ?? {});

        var src2;
        res?.parts?.every((e) => {
          var lesson = e?.lessons.find((a) => {
            return a.id == idLecture;
          });

          src2 = lesson?.video?.urlVideo;
          if (typeof src2 != "undefined") {
            console.log("Break");
            return false;
          } else {
            return true;
          }
        });
        setSrc(src2);
        // console.log("course", course);
      } catch (error) {
        console.log(error);
      }
    })();
  }, []);

  console.log("src", src);

  return (
    <>
      <HeaderLecture />
      <Box className={classes.root}>
        {/* <Container> */}
        <Grid container spacing={0}>
          <Grid
            item
            className={classes.left}
            xl={9}
            lg={9}
            md={9}
            sm={12}
            xs={12}
          >
            <div
              className={classNames(
                classes.leftRoot,
                showList && classes.fullScreen
              )}
            >
              {src && <VideoLecture video={src} />}
              {/* <ListAccordion parts={course.parts} />
              <ListAccordion parts={course.parts} /> */}
            </div>
          </Grid>
          <Grid
            item
            className={classes.right}
            xl={3}
            lg={3}
            md={3}
            sm={12}
            xs={12}
          >
            <div
              className={classNames(
                classes.rightRoot,
                showList && classes.noneList
              )}
            >
              <div className="title">
                <Link to={`/course/${idCourse}`}>{course.title}</Link>
                <i
                  onClick={handleToggleList}
                  className="fas fa-arrow-right"
                ></i>
              </div>
              <ListAccordion parts={course.parts} />
            </div>
          </Grid>
        </Grid>
        {/* </Container> */}
      </Box>
    </>
  );
}

export default Lecture;
