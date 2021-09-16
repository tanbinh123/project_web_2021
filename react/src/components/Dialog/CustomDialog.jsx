import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
} from '@material-ui/core';
import React from 'react';

export default function CustomDialog(props) {
  const {
    title = '',
    content = null,
    id = '',
    open = false,
    onClose = null,
    fullScreen = false,
  } = props;
  const handleClose = () => {
    if (onClose) onClose();
  };
  return (
    <>
      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="form-dialog-title"
        fullScreen={fullScreen}
        className="custom-dialog"
      >
        <DialogTitle
          id={`custom-dialog-${id}`}
          className="custom-dialog__title"
        >
          <span>{title}</span>
          <i className="fas fa-times" onClick={handleClose}></i>
        </DialogTitle>
        <DialogContent>{content}</DialogContent>
        <DialogActions>
          <Button onClick={handleClose} color="primary">
            Đóng
          </Button>
        </DialogActions>
      </Dialog>
    </>
  );
}
