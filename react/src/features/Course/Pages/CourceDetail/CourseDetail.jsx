import {
  Box,
  Container,
  // DialogActions,
  DialogContent,
  DialogTitle,
  Grid,
  //makeStyles,
  Paper,
  useMediaQuery,
  useTheme,
} from '@material-ui/core';
import Dialog from '@material-ui/core/Dialog';
import { Close } from '@material-ui/icons';
import React, { useEffect, useState } from 'react';
import { useRecoilState } from 'recoil';
import courseApi from '../../../../api/courseApi';
import { addLocalStorageCourses, DataUser } from '../../../../app/DataUser';
import Header from '../../../../components/header/index';
import { isEmpty } from '../../../../components/tools/Tools';
import CourseDetailCSS from './CSSCourseDetail';
import Lecture from './Lecture/Lecture';
import LeftCD from './LeftCourseDetail/LeftCD';
import RightCD from './RightCourseDetail/RightCD';
import {
  useHistory,
  useParams,
  useRouteMatch,
  useLocation,
} from 'react-router-dom';
import { useSnackbar } from 'notistack';

function CourseDetail(props) {
  const classes = CourseDetailCSS();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { idCourse } = useParams();
  // console.log(idCourse);
  const { url } = useRouteMatch();
  const { push } = useHistory();
  const { enqueueSnackbar } = useSnackbar();
  const [isOpenDialog, setIsOpenDialog] = useState(false);
  const theme = useTheme();
  const fullScreen = useMediaQuery(theme.breakpoints.down('xs'));
  const [course, setCourse] = useState({
    isFull: false,
  });
  console.log(course);
  const [totalLesson, setTotalLesson] = React.useState(0);
  function handleToggleDialog() {
    setIsOpenDialog(!isOpenDialog);
  }
  const { host, pathname, protocol } = window.location;
  // console.log(`${protocol}//${host}${pathname}`);
  async function handleOnClickBuy() {
    if (course?.actived === false) {
      enqueueSnackbar('Khóa học đã bị khóa', { variant: 'error' });
      return;
    }
    if (!isEmpty(dataUser.token)) {
      const res = await courseApi.payment({
        returnUrl: `${protocol}//${host}${pathname}`,
        idCourse: idCourse,
      });
      if (!!!res?.status) {
        window.location = res?.url;
      } else {
        enqueueSnackbar(res?.data?.message?.en, { variant: 'error' });
      }
      // window.location = res.url;
    } else {
      push('/auth/login');
    }
  }

  useEffect(() => {
    window.scrollTo(0, 0);
    getDataCourse();
    // totalCourse();
    return () => {
      setCourse({});
    };
  }, [url, dataUser.token]);
  // console.log("init Detail", course);
  const getDataCourse = async () => {
    try {
      if (!isEmpty(dataUser.token)) {
        const res1 = await courseApi.courseAccess({ idCourse: idCourse });
        if (!!!res1.status) {
          setCourse(res1);
          totalCourse(res1);
        }
        // console.log(res1);
      } else {
        const res = await courseApi.get(idCourse);
        if (res.status == 500 || res.status == 400) {
          push('/course');
        } else {
          setCourse({
            isFull: false,
            ...res,
          });
          totalCourse(res);
        }
      }

      // console.log("course", course);
    } catch (error) {
      console.log(error);
    }
  };
  const totalCourse = (course) => {
    let total = 0;
    if (!isEmpty(course?.parts)) {
      Array.from(course?.parts).map((item) => {
        Array.from(item?.lessons).map((item1) => {
          total++;
        });
      });
    }
    setTotalLesson(total);
  };

  const handleUpdateCourse = async () => {
    try {
      if (!isEmpty(dataUser.token)) {
        const res1 = await courseApi.check({ idCourse: idCourse });
        // console.log("check", res1);
        if (res1.status == 400 || res1.status == 500) {
          const res = await courseApi.get(idCourse);
          // console.log("review", res);
          if (res.status == 500) {
            push('/course');
          }
          setCourse({
            isFull: false,
            ...res,
          });
        } else {
          setCourse({
            isFull: true,
            ...res1,
          });
        }
      }
    } catch (error) {
      console.log(error);
    }
  };
  //TODO
  const location = useLocation();
  let transitionSuccess = location?.search.includes('vnp_TransactionStatus=00');
  useEffect(() => {
    (async () => {
      if (transitionSuccess) {
        const res = await courseApi.getCoursesBought();
        if (!!!res?.status) {
          setDataUser({ ...dataUser, courses: res });
          addLocalStorageCourses(res);
        } else {
          enqueueSnackbar(res?.data?.message?.en, { variant: 'error' });
        }
      }
    })();
    return () => {};
  }, [transitionSuccess]);
  return (
    <>
      <Header />
      <Box className={classes.backgroundHeader} />
      <Box className={classes.root}>
        <Container>
          <Grid container spacing={3}>
            <Grid
              item
              className={classes.left}
              xl={8}
              lg={8}
              md={8}
              sm={12}
              xs={12}
            >
              <Paper elevation={0}>
                {/* --------------------- Left Data --------------------------- */}
                <LeftCD
                  idCourse={course?.id}
                  rateStar={course?.rateStar}
                  title={course?.title}
                  description={course?.description}
                  longDescription={course?.longDescription}
                  learnings={course?.learnings}
                  parts={course?.parts}
                  totalLesson={totalLesson}
                  isFull={course?.isFull}
                />
              </Paper>
            </Grid>
            <Grid
              item
              className={classes.right}
              xl={4}
              lg={4}
              md={4}
              sm={12}
              xs={12}
            >
              <Paper elevation={0}>
                <RightCD
                  onClickOpenVideo={handleToggleDialog}
                  onClickBuy={handleOnClickBuy}
                  poster={course?.imagePoster?.image}
                  course={course}
                  totalLesson={totalLesson}
                />
              </Paper>
            </Grid>
          </Grid>
        </Container>
      </Box>
      <Dialog
        className={classes.DialogCustom}
        fullScreen={fullScreen}
        maxWidth="lg"
        onClose={handleToggleDialog}
        aria-labelledby="customized-dialog-title"
        open={isOpenDialog}
      >
        <DialogTitle id="customized-dialog-title" onClose={handleToggleDialog}>
          <span className={classes.smallTitle}>Giới thiệu khóa học</span>
          <span className={classes.iconClose} onClick={handleToggleDialog}>
            <Close />
          </span>
          <br />
          <span className={classes.titleVideo}>{course.title}</span>
        </DialogTitle>
        <DialogContent dividers>
          <div className={classes.video}>
            <video autoPlay /* muted */ loop className="video__play" controls>
              <source src={course.demo?.urlVideo} type="video/mp4"></source>
            </video>
          </div>
        </DialogContent>
      </Dialog>
    </>
  );
}

export default CourseDetail;
