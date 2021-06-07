import { yupResolver } from "@hookform/resolvers/yup";
import React from "react";
import { useForm } from "react-hook-form";
import * as yup from "yup";
function FormRating(props) {
  const schema = yup.object().shape({
    // username: yup.string().required("Vui lòng nhập username"),
  });
  const form = useForm({
    mode: "onBlur",
    defaultValues: {},
    resolver: yupResolver(schema),
  });
  return (
    <form>
      <div>abc</div>
    </form>
  );
}

export default FormRating;
