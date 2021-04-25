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
  const [showList, setShowList] = useState(false);
  const handleToggleList = () => {
    setShowList(!showList);
  };
  useEffect(() => {
    (async () => {
      try {
        const res = await courseApi.get(idCourse);
        // console.log(res);

        setCourse(res ?? {});
        // console.log("course", course);
      } catch (error) {
        console.log(error);
      }
    })();
  }, []);
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
                    src="https://r2---sn-oxuo5h-nboe.googlevideo.com/videoplayback?expire=1619111220&ei=1FiBYP_GKqjt3LUP-dCGgAI&ip=119.17.249.22&id=o-ALmWyWXBTCls82THUdNKrJowTFB_oIG1_p_tVubilfZv&itag=18&source=youtube&requiressl=yes&mh=QG&mm=31%2C29&mn=sn-oxuo5h-nboe%2Csn-8pxuuxa-nboe6&ms=au%2Crdu&mv=m&mvi=2&pl=24&initcwndbps=711250&vprv=1&mime=video%2Fmp4&ns=4pT-t5O7xfECt0nvoD_DZ3gF&gir=yes&clen=13501675&ratebypass=yes&dur=315.907&lmt=1616685647727387&mt=1619089239&fvip=4&fexp=24001373%2C24007246&c=WEB&txp=5430432&n=VTyD_1ojQadOsEgn&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgP-8hSbznkDTQ-FsBIw_eaojTyOxwaBhBbcfLoy1nG1sCIQCbjM5Xfpmbv7TQ-WVPkcstzH3U6D5GbqrNfIGRNZykNw%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRAIgJ6a3nifYLuMoANZuhMIhsw3gvIu1ctjrQVQAJiwwbd0CIDwpRyu2T7MbDTX2MNGHAjpXsKKogYj1Txlv9aM7mfPE"
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
