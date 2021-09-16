import { DialogContent, makeStyles } from "@material-ui/core";
import Dialog from "@material-ui/core/Dialog";
import DialogTitle from "@material-ui/core/DialogTitle";
import { Close } from "@material-ui/icons";
import React from "react";
import { isEmpty } from "src/Tool/Tools";
const useStyles = makeStyles((theme) => ({
  dialog: {},
  dialogContent: {
    minHeight: 360,
  },
  title: {
    "&>h2": {
      color: "var(--colorBlack2)",

      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      "&>i": {
        color: "var(--colorBlack2)",
        cursor: "pointer",
        fontSize: 25,
        "&:hover": {
          color: "var(--colorBlack1)",
        },
      },
    },
  },
}));
function CustomDialog(props) {
  const classes = useStyles();
  const { closeDialog, isOpen, content = null, id = "", title = "" } = props;

  const handleClose = () => {
    closeDialog();
  };
  return (
    <Dialog
      onClose={handleClose}
      aria-labelledby={`custom-dialog-${id}`}
      open={isOpen}
      className={classes.dialog}
    >
      <DialogTitle className={classes.title} id={`custom-dialog-${id}`}>
        <span>{title}</span>
        <i className="fas fa-times" onClick={handleClose}></i>
      </DialogTitle>
      <DialogContent className={classes.dialogContent}>
        {!isEmpty(content) && content}
      </DialogContent>
    </Dialog>
  );
}
export default CustomDialog;
