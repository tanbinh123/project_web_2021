import { Box, Grid } from "@material-ui/core";
import classNames from "classnames";
import React, { useEffect, useState } from "react";
import { useParams, useRouteMatch } from "react-router";
import { Link } from "react-router-dom";
import courseApi from "../../../../../api/courseApi";
import HeaderLecture from "../../../../../components/HeaderLecture/HeaderLecture";
import CSSLecture from "./CSSLecture";
import ListAccordion from "./ListLecture/ListAccordion";
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
  const [lesson, setLesson] = useState();
  const [showList, setShowList] = useState(false);
  const handleToggleList = () => {
    setShowList(!showList);
  };
  useEffect(() => {
    (async () => {
      try {
        const res = await courseApi.check({ idCourse: idCourse });
        console.log(res);
        if(res.status==400){
          alert("Bạn chưa mua khóa học");
          window.location=url.slice(0,url.indexOf("/lecture"));
        }else
        setCourse(res ?? {});

        var src2;
        var index=0;
        res?.parts?.every((e) => {
          var lesson = e?.lessons.find((a) => {
            index++;
            return index == idLecture;
          });

          src2 = lesson?.video?.urlVideo;
          if (typeof src2 != "undefined") {
            //console.log("Break");
            setLesson(lesson);
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
    return setSrc();
  }, [url]);

  //console.log("src", src);
  console.log("lesson", lesson);

  return (
    <>
      {lesson&&<HeaderLecture lesson={lesson} index={idLecture}/>}
      
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
