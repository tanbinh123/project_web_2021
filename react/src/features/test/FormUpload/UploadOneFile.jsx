import React from "react";
import fileUploadApi from "../../../api/fileUploadApi";
import FormUploadOne from "./Form/FormUploadOne";

UploadOneFile.propTypes = {};

function UploadOneFile(props) {
  // const dispatch = useDispatch();
  // const { push } = useHistory();

  const handleOnSubmit = async (values) => {
    try {
      const formData = new FormData();
      formData.append("name", values.name);
      formData.append("file", values.file);
      const data = await fileUploadApi.upload(formData);
      console.log("Upload File", data);
    } catch (error) {
      console.log(error);
    }
  };

  return <FormUploadOne onSubmit={handleOnSubmit} />;
}

export default UploadOneFile;
