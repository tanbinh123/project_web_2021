import {
  Box,
  Container,
  // DialogActions,
  DialogContent,
  DialogTitle,
  Grid,
  //makeStyles,
  Paper
} from "@material-ui/core";
import Dialog from "@material-ui/core/Dialog";
import { Close } from "@material-ui/icons";
import React, { useState } from "react";
import Header from "../../../../components/header/index";
import CourseDetailCSS from "./CSSCourseDetail";
import LeftCD from "./LeftCourseDetail/LeftCD";
import RightCD from "./RightCourseDetail/RightCD";

function CourseDetail() {
  const classes = CourseDetailCSS();
 // const { idCourse } = useParams();
  const [isOpenDialog, setIsOpenDialog] = useState(false);
  function handleToggleDialog() {
    setIsOpenDialog(!isOpenDialog);
  }
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
                <LeftCD />
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
                <RightCD onClickOpenVideo={handleToggleDialog} />
              </Paper>
            </Grid>
          </Grid>
        </Container>
      </Box>
      <Dialog
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
          Kiến thức cơ bản, cốt lõi dân IT cần học trước
        </DialogTitle>
        <DialogContent dividers>
          <video autoplay={true} controls style={{ width: 852, height: 480 }}>
            <source
              src="https://r3---sn-oxuo5h-nboe.googlevideo.com/videoplayback?expire=1617206512&ei=kEhkYIaWNuiNz7sP6ZqtsA4&ip=119.17.249.20&id=o-AM_Sp-D5EKVXwy0ix8RxmXVjXFHaq_eQF1qrauLgDgNP&itag=136&aitags=133%2C134%2C135%2C136%2C137%2C160%2C242%2C243%2C244%2C247%2C248%2C278&source=youtube&requiressl=yes&mh=fG&mm=31%2C29&mn=sn-oxuo5h-nboe%2Csn-8pxuuxa-nbo6l&ms=au%2Crdu&mv=m&mvi=3&pl=24&initcwndbps=663750&vprv=1&mime=video%2Fmp4&ns=cT2_pxUgBQvgypuYBPNAyBcF&gir=yes&clen=34553943&dur=3657.052&lmt=1616298405991525&mt=1617184606&fvip=3&keepalive=yes&fexp=24001373%2C24007246&c=WEB&txp=5535432&n=COrYJJK4qxDQMpHOJa&sparams=expire%2Cei%2Cip%2Cid%2Caitags%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhALHZuwvIvdkKHiO8p6ZBQ3N51S9VCTnhvqw5gw0HGBf8AiB6C4Q0yMCoexSRkHGW1d0L25Ub_eUzDMrzWTkmHiHhZw%3D%3D&sig=AOq0QJ8wRQIhAIzLC3a_Q0bBlXl9oDvQBiKVGsCZnYZRHcp2sxyYUDD7AiAgr9-D9yzkPaiNckB0aE4b5Q7Wa6iZ8jkxooKGLe8FWw%3D%3D"
              type="video/mp4"
            ></source>
          </video>
        </DialogContent>
      </Dialog>
    </>
  );
}

export default CourseDetail;
