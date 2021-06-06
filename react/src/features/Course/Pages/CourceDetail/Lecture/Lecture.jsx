import { Box, Grid } from "@material-ui/core";
import classNames from "classnames";
import React, { useEffect, useState } from "react";
import { useHistory, useParams, useRouteMatch } from "react-router-dom";
import { Link } from "react-router-dom";
import courseApi from "../../../../../api/courseApi";
import HeaderLecture from "../../../../../components/HeaderLecture/HeaderLecture";
import { isEmpty } from "../../../../../components/tools/Tools";
import CSSLecture from "./CSSLecture";
import ListAccordion from "./ListLecture/ListAccordion";
import VideoLecture from "./ListLecture/VideoLecture";

Lecture.propTypes = {};

function Lecture(props) {
  const classes = CSSLecture();
  const { idLecture } = useParams();
  const { url } = useRouteMatch();
  const { push } = useHistory();
  const idCourse = url.slice(
    url.indexOf("/course/") + 8,
    url.indexOf("/lecture")
  );
  const [course, setCourse] = useState({});
  const [lesson, setLesson] = useState({});
  const [showList, setShowList] = useState(false);
  const handleToggleList = () => {
    setShowList(!showList);
  };
  // console.log(idLecture);
  // console.log(idCourse);
  useEffect(() => {
    (async () => {
      try {
        const res = await courseApi.check({ idCourse: idCourse });
        // console.log(res);
        if (res.status == 400) {
          push(`/course/${idCourse}`);
        } else {
          setCourse(res);
          //get lessson
          let indexLesson = 1;
          let tmpLecture = {};
          Array.from(res.parts).map((part) => {
            Array.from(part.lessons).map((lesson) => {
              if (indexLesson == idLecture) {
                tmpLecture = lesson;
                setLesson(lesson);
                indexLesson++;
              } else {
                indexLesson++;
              }
            });
          });
          if (isEmpty(tmpLecture)) push(`/course/${idCourse}`);
        }
      } catch (error) {
        console.log(error);
      }
    })();
    return () => {
      setCourse({});
      setLesson({});
    };
  }, [url]);
  // console.log("lesson", lesson);

  return (
    <>
      <HeaderLecture
        idCourse={idCourse}
        title={lesson.description}
        idLecture={idLecture}
      />

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
              <VideoLecture video={lesson.video} />
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
      </Box>
    </>
  );
}

export default Lecture;
