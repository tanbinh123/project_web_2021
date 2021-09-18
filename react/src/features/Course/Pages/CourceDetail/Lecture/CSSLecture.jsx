import { makeStyles } from '@material-ui/core';

const CSSLecture = makeStyles((theme) => ({
  root: {
    fontFamily: "'Open Sans', sans-serif",
    '&~.footer': {
      display: 'none',
    },
  },
  leftRoot: {
    position: 'fixed',

    width: '75%',
    overflowX: 'hidden',
    overflowY: 'auto',
    '&>.videoRoot': {
      '&>.video': {
        // minHeight: 400,
        minWidth: '100%',
        maxHeight: '700px',
        maxWidth: '100%',
      },
      '&>span': {
        position: 'absolute',
        color: 'var(--colorOrange1)',
        position: 'absolute',
        left: '86%',
        top: '4%',
        zIndex: 1,
        width: '100%',
      },
    },
    height: '100%',
  },
  rightRoot: {
    position: 'fixed',
    width: '25%',
    overflowX: 'hidden',
    overflowY: 'auto',
    height: '100%',
    '&>.title': {
      width: '25%',
      position: 'fixed',
      zIndex: 1,
      display: 'flex',
      justifyContent: 'space-between',
      background: 'var(--colorWhite1)',
      padding: '20px',
      fontWeight: 600,
      borderBottom: '2px var(--colorGray2) solid',
      minHeight: '70px',
      maxHeight: '75px',
      overflow: 'hidden',
      boxShadow: '0px 5px 6px rgba(0,0,0,0.3)',
      '&>a': {
        textDecoration: 'none',
        color: 'var(--colorBlack1)',
        marginRight: 10,
        fontSize: '18px',
        '&:hover': {
          color: 'var(--colorOrange2)',
          transition: 'all 0.2s linear',
        },
      },
      '&>i': {
        color: 'var(--colorBlack1)',
        cursor: 'pointer',
        '&:hover': {
          color: 'var(--colorOrange2)',
          transition: 'all 0.2s linear',
        },
      },
    },
    '&>.title+div': { marginTop: 75 },
  },

  [theme.breakpoints.down('md')]: {
    leftRoot: {
      position: 'relative',
      width: '100%',
      '&>.videoRoot': {
        '&>.video': {
          width: '100%',
        },
      },
      height: '100%',
    },
    rightRoot: {
      position: 'relative',
      width: '100%',
      '&>.title': {
        position: 'relative',
        width: '100%',
      },
      '&>.title+div': { marginTop: 0 },
    },
  },
  noneList: {
    display: 'none',
  },
  fullScreen: {
    width: '100%',
    '&>.video': {
      minWidth: '100%',
      height: '70%',
      background: 'var(--colorGray2)',
    },
  },
  showList: {
    right: '0',
    width: '200px',
    height: '50px',
    position: 'absolute',
    background: 'rgba(0,0,0,0.5)',
    borderBottomLeftRadius: '15px',
    color: '#fff',
    display: 'flex',
    alignItems: 'center',
    fontSize: '20px',
    justifyContent: 'space-around',
    transform: 'translateX(80%)',
    cursor: 'pointer',
    zIndex: '1',
    transition: 'all 0.5s ease-in',
    display: 'none',
    '&:hover': {
      transform: 'translateX(0%)',
    },
  },
  showListActive: {
    display: 'flex',
  },
}));
export default CSSLecture;
