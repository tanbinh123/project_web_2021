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
  const theme = useTheme();
  const fullScreen = useMediaQuery(theme.breakpoints.down("xs"));
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
          Kiến thức cơ bản, cốt lõi dân IT cần học trước
        </DialogTitle>
        <DialogContent dividers>
          <div className={classes.video}>
            <video autoplay={true} className="video__play" controls>
              <source
                src="https://r3---sn-oxuo5h-nboe.googlevideo.com/videoplayback?expire=1617909570&ei=4gJvYNjJLZbcz7sPt4qt8As&ip=119.17.249.22&id=o-ACwmZlJjxe9Qoku3wc-A2gcTXiP80nsq7X-vvOOJYr6p&itag=135&aitags=133%2C134%2C135%2C136%2C137%2C160%2C242%2C243%2C244%2C247%2C248%2C278&source=youtube&requiressl=yes&mh=2r&mm=31%2C29&mn=sn-oxuo5h-nboe%2Csn-8pxuuxa-nboll&ms=au%2Crdu&mv=m&mvi=3&pl=24&initcwndbps=685000&vprv=1&mime=video%2Fmp4&ns=PGs5beXu0FpRhcfobTPpS0wF&gir=yes&clen=64170713&dur=2407.966&lmt=1607990411572174&mt=1617887825&fvip=6&keepalive=yes&fexp=24001373%2C24007246&c=WEB&txp=5432434&n=PeGze3GXRL3sFTvi&sparams=expire%2Cei%2Cip%2Cid%2Caitags%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRAIgXfbyxKRX9V7f4nyr6p6xlK6Aw4nHVRhjU_pL0owsIxACIGm3N79ICNWRQtdBE8QgPETvqjEs3E0jWQon4hgfCjJ1&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhANXejJVovHvFw3Q5UNAFRi09r01zbFXSyKARr8cq4bZ1AiAviRDUu_MNRcsMOT2prQ4TNIUOBGLwM7YV8MCBqw2ICQ%3D%3D"
                type="video/mp4"
              ></source>
            </video>
          </div>
        </DialogContent>
      </Dialog>
    </>
  );
}

export default CourseDetail;
