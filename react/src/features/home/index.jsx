import { Container, CssBaseline, makeStyles } from '@material-ui/core';
import React, { useEffect, useState, useCallback } from 'react';
import { Link } from 'react-router-dom';
import { useRecoilState } from 'recoil';
import imageApi from '../../api/imageApi';
import { DataUser } from '../../app/DataUser';
import CustomButton from '../../components/Button/CustomButton';
import CardCourse from '../../components/card/CardCourse';
import Header from '../../components/header';
import { isEmpty } from '../../components/tools/Tools';
import BoughtHome from './components/BoughtHome';
import Representative from './components/Representative';

const useStyles = makeStyles((theme) => ({
  root: {
    fontFamily: "'Open Sans', sans-serif",
  },
  // bgHome: {
  //   position: 'relative',
  //   minHeight: '100vh',
  //   display: 'flex',
  //   alignItems: 'center',
  //   justifyContent: 'start',
  //   transition: 'all 2s ease-in',
  //   backgroundColor: '#00000050',
  //   // backgroundImage: 'url("/assets/images/1.jpg")',
  //   backgroundSize: 'cover',
  //   backgroundPosition: 'center',
  //   backgroundRepeat: 'no-repeat',
  // },
  wellcome: {
    color: 'var(--colorWhite1)',
    marginLeft: 100,
    zIndex: 1,
    position: 'absolute',
    top: '50%',
    left: 0,
    transform: 'translateY(-50%)',
    '&>h5': {
      fontSize: 14,
      marginBottom: 20,
      fontWeight: 400,
    },
    '&>h1': {
      textTransform: 'uppercase',
      fontSize: 50,
      fontWeight: 600,
      marginBottom: 20,
    },
  },
  homeContent1: {
    margin: '30px 0',
    '&>ul': {
      display: 'flex',
      justifyContent: 'space-around',
      '&>li': {
        display: 'flex',
        flexFlow: 'column',
        alignItems: 'center',
        '&>i': {
          color: 'var(--colorOrange2)',
          fontSize: 40,
          marginBottom: 15,
        },
        '&>span': {
          fontSize: 18,
          fontWeight: 600,
          color: 'var(--colorBlack2)',
        },
      },
    },
  },
  [theme.breakpoints.down('md')]: {
    root: {},
    bgHome: {},
    wellcome: {
      marginLeft: 0,
      display: 'flex',
      flexFlow: 'column',
      justifyContent: 'center',
      alignItems: 'center',
      '&>h5': {
        textAlign: 'center',
      },
      '&>h1': {
        textAlign: 'center',
      },
    },
    homeContent1: {
      marginTop: 50,
      '&>ul': {
        display: 'flex',
        flexFlow: 'column',
        justifyContent: 'space-around',
        '&>li': {
          marginBottom: 50,
        },
      },
    },
  },
}));

function Home(props) {
  const classes = useStyles();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const [arrImg, setArrImg] = useState([
    '/assets/images/1.jpg',
    '/assets/images/2.jpg',
    '/assets/images/3.jpg',
  ]);

  useEffect(() => {
    let intervalBgHome;
    //get list img
    (async () => {
      const res = await imageApi.getImageByTagName('background_home');
      let tmpArr = [];
      if (res.length > 0) {
        // item?.image?.image
        Array.from(res).forEach((item) => {
          tmpArr.push(item?.image?.image);
        });
        setArrImg(tmpArr);
      }
      const imgs = document.querySelectorAll('.img-bg-home');
      imgs[0]?.classList.add('active');
      let i = 0;
      intervalBgHome = setInterval(() => {
        i++;
        if (i >= imgs.length) i = 0;
        removeClassActive();
        // console.log(i);
        imgs[i]?.classList.add('active');
      }, 5000);
    })();
    return () => {
      clearInterval(intervalBgHome);
    };
  }, []);
  function removeClassActive() {
    const imgs = document.querySelectorAll('.img-bg-home');
    imgs.forEach((item) => {
      item.classList.remove('active');
    });
  }
  return (
    <div className={classes.root}>
      <Header />
      <CssBaseline />
      <div id="bg-home" className={classes.bgHome}>
        {Array.from(arrImg).map((item, idx) => (
          <div
            key={idx}
            className="img-bg-home"
            style={{
              backgroundImage: `url("${item}")`,
            }}
          ></div>
        ))}
        <div className={classes.wellcome}>
          <h5>Đừng xấu hổ khi bạn không biết, ta chỉ xấu hổ khi không học</h5>
          <h1>Học để thắp sáng tương lai</h1>
          <Link to="/course" style={{ textDecoration: 'none' }}>
            <CustomButton title="Học Ngay" css={true} />
          </Link>
        </div>
      </div>
      <Container>
        <div className={classes.homeContent1}>
          <ul>
            <li>
              <i className="fas fa-users"></i>
              <span>Có 10+ học viên</span>
            </li>
            <li>
              <i className="fas fa-book-open"></i>
              <span>Có ?? Khóa học</span>
            </li>
            <li>
              <i className="fas fa-globe-asia"></i>
              <span>Học bất kì đâu</span>
            </li>
          </ul>
        </div>
        <Representative />
        {!isEmpty(dataUser.courses) && <BoughtHome />}
      </Container>
    </div>
  );
}

export default Home;
