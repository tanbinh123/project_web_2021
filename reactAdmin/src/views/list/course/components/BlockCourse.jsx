import { makeStyles } from "@material-ui/core";
import React, { useState } from "react";
import courseApi from "src/api/courseApi";
import CustomButtonRed from "src/components/CustomButtonRed";
import CustomDialogAction from "src/components/CustomDialogAction";

function BlockCourse(props) {
  const { item, onReload = null } = props;
  const [isOpenDialog, setOpenDialog] = useState(false);
  const handleOpenDialog = () => {
    setOpenDialog(!isOpenDialog);
  };
  const handleBlockCourse = async () => {
    const res = await courseApi.blockCourse(item.id);
    console.log(res);
    if (onReload) onReload();
  };
  return (
    <>
      <CustomButtonRed title="Khóa" onClick={handleOpenDialog} />
      <CustomDialogAction
        title={`Khóa khóa học : ${item.title}`}
        id={item.id}
        closeDialog={handleOpenDialog}
        isOpen={isOpenDialog}
        accepct={handleBlockCourse}
        content={
          <div>
            Bạn có thực sự muốn khóa khóa học <b>{item.title}</b> này hay không
            ?
            <br />
            <br />
            Khóa học bị khóa sẽ không mua được nhưng nhũng người đã mua vẫn học
            bình thường
          </div>
        }
      />
    </>
  );
}

export default BlockCourse;
