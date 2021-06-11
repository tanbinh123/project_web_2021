import { DialogContent, makeStyles } from "@material-ui/core";
import Dialog from "@material-ui/core/Dialog";
import DialogTitle from "@material-ui/core/DialogTitle";
import { Close } from "@material-ui/icons";
import React from "react";
import { isEmpty } from "src/Tool/Tools";
const useStyles = makeStyles((theme) => ({
  title: {
    "&>h2": {
      color: "var(--colorBlack2)",

      display: "flex",
      justifyContent: "space-between",
      alignItems: "center",
      "&>svg": {
        color: "var(--colorBlack2)",
        cursor: "pointer",
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
    closeDialog(!isOpen);
  };
  return (
    <Dialog
      onClose={handleClose}
      aria-labelledby={`custom-dialog-${id}`}
      open={isOpen}
    >
      <DialogTitle className={classes.title} id={`custom-dialog-${id}`}>
        {title} <Close onClick={handleClose} />
      </DialogTitle>
      <DialogContent>{!isEmpty(content) && content}</DialogContent>
    </Dialog>
  );
}
export default CustomDialog;
