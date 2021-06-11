import React, { useState } from "react";
import CustomDialog from "src/components/CustomDialog";

function ImageHTML(props) {
  const { item = {} } = props;
  const [openDialog, setOpenDialog] = useState(false);

  const handleClickOpenDialog = () => {
    setOpenDialog(!openDialog);
  };
  return (
    <td className="tdCenter">
      <img
        className="row_image"
        src={item.thumbnail}
        onClick={handleClickOpenDialog}
      />
      <CustomDialog
        closeDialog={handleClickOpenDialog}
        isOpen={openDialog}
        id={item.id}
        title="Hình ảnh thumbnail"
        content={
          <div>
            <img className="img_thumbnail" src={item.thumbnail} />
          </div>
        }
      />
    </td>
  );
}

export default ImageHTML;
