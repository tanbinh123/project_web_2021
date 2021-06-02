import { DialogContent, makeStyles } from "@material-ui/core";
import Dialog from "@material-ui/core/Dialog";
import DialogTitle from "@material-ui/core/DialogTitle";
import { Close } from "@material-ui/icons";
import React from "react";
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
function SimpleDialog(props) {
  const classes = useStyles();
  const { onClose, open, content = null, id = 0 } = props;

  const handleClose = () => {
    onClose(!open);
  };

  return (
    <Dialog
      onClose={handleClose}
      aria-labelledby={`simple-dialog-${id}`}
      open={open}
    >
      <DialogTitle className={classes.title} id={`simple-dialog-${id}`}>
        Image <Close onClick={handleClose} />
      </DialogTitle>
      <DialogContent>{content && content}</DialogContent>
    </Dialog>
  );
}
export default SimpleDialog;
