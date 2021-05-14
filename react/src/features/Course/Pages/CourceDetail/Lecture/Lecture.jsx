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
  const [src, setSrc] = useState({ url: "" });
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

        console.log(src2);
        setSrc({ url: src2 });
        // console.log("course", course);
      } catch (error) {
        console.log(error);
      }
    })();
  }, []);

  console.log("init lecture", course);

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
              <div className="videoRoot">
                <span>
                  <i className="fas fa-angle-double-left"></i> Xem danh sách bài
                  học
                </span>

                <video
                  autoPlay
                  //  muted
                  loop
                  className="video"
                  controls
                >
                  <source
                    src={src.url}
                    //src="http://localhost:25001/video/user/admin/video/171/mp4/8 lời khuyên giúp học lập trình tại F8 hiệu quả hơn!"
                    type="video/mp4"
                  ></source>
                </video>
              </div>
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
