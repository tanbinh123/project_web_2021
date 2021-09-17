import { makeStyles } from '@material-ui/core';

const ChangePasswordCss = makeStyles((theme) => ({
  rightRoot: {
    marginBottom: 50,
    //o tren
    '&>div:first-of-type': {
      // backgroundImage:
      //   "linear-gradient(to top,var(--colorBlack1),var(--colorBlack2))",
      display: 'flex',
      justifyContent: 'space-between',
      padding: '30px 40px 20px 40px',
      color: 'var(--colorWhite0)',
      borderTopLeftRadius: '20px',
      borderTopRightRadius: '20px',
      boxShadow: '0px 0px 10px var(--colorBlack1)',

      '&>ul': {
        display: 'flex',
        flexFlow: 'column',
        alignItems: 'flex-start',
        width: '100%',
        '&>li': {
          display: 'flex',
          width: '100%',
        },
        '&>li:nth-child(1)': {
          // justifyContent: "center",
          marginBottom: 15,
          '&>span': {
            fontSize: '25px',
            fontWeight: 600,
          },
        },
        '&>li:nth-child(2)': {
          justifyContent: 'flex-end',
          '&>span': {},
        },
      },
    },

    // o duoi
    '&>div:last-of-type': {
      backgroundColor: 'var(--colorWhite0)',
      color: 'var(--colorBlack2)',
      padding: '30px 20px 15px 20px',

      borderBottomLeftRadius: '20px',
      borderBottomRightRadius: '20px',
      boxShadow: '0px 3px 7px var(--colorBlack1)',
    },
  },
  form: {
    marginBlock: '30px',
  },
  rowForm: {
    display: 'flex',
    alignItems: 'center',
    '&>span': {
      minWidth: '200px',
      textAlign: 'right',
      marginRight: '20px',
    },
  },
  lastRow: {
    display: 'flex',
    justifyContent: 'center',
    marginTop: '20px',
  },
  [theme.breakpoints.down('md')]: {
    rowForm: {
      display: 'flex',
      alignItems: 'center',
      '&>span': {
        display: 'none',
      },
    },
  },
}));
export default ChangePasswordCss;
