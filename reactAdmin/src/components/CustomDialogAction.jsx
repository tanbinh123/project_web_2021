import { DialogActions, DialogContent, makeStyles } from "@material-ui/core";
import Dialog from "@material-ui/core/Dialog";
import DialogTitle from "@material-ui/core/DialogTitle";
import { Close } from "@material-ui/icons";
import React from "react";
import { isEmpty } from "src/Tool/Tools";
import CustomButton from "./CustomButton";
import CustomButtonRed from "./CustomButtonRed";
const useStyles = makeStyles((theme) => ({
  dialog: {},
  title: {
    "&>h2": {
      color: "var(--colorBlack2)",

      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      fontWeight: "600",
      "&>svg": {
        color: "var(--colorBlack2)",
        cursor: "pointer",
        "&:hover": {
          color: "var(--colorBlack1)",
        },
      },
    },
  },
  action: {
    borderTop: "1px solid var(--colorGray2)",
    margin: "0px 20px 10px 20px",
    paddingTop: "20px",
  },
  content: {
    "&>div": {
      fontSize: "16px",
      margin: "20px 0",
    },
  },
}));
function CustomDialogAction(props) {
  const classes = useStyles();
  const {
    closeDialog,
    isOpen,
    content = null,
    id = "",
    title = "",
    accepct = null,
  } = props;

  const handleClose = () => {
    closeDialog(!isOpen);
  };
  const handleCloseAndYes = () => {
    if (!isEmpty(accepct)) accepct();
    closeDialog(!isOpen);
  };
  return (
    <Dialog
      className={classes.dialog}
      onClose={handleClose}
      aria-labelledby={`custom-dialog-${id}`}
      open={isOpen}
    >
      <DialogTitle className={classes.title} id={`custom-dialog-${id}`}>
        {title} <Close onClick={handleClose} />
      </DialogTitle>
      <DialogContent className={classes.content}>
        {!isEmpty(content) && content}
      </DialogContent>
      <DialogActions className={classes.action}>
        <CustomButtonRed title="Không" onClick={handleClose} />
        <CustomButton title="Có" onClick={handleCloseAndYes} />
      </DialogActions>
    </Dialog>
  );
}
export default CustomDialogAction;
