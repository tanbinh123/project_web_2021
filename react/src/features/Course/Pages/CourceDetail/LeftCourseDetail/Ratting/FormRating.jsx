import { yupResolver } from "@hookform/resolvers/yup";
import { Avatar, makeStyles } from "@material-ui/core";
import Rating from "@material-ui/lab/Rating";
import React, { useEffect, useState } from "react";
import { Controller, useForm } from "react-hook-form";
import { useRecoilState } from "recoil";
import * as yup from "yup";
import { DataUser } from "../../../../../../app/DataUser";
import courseApi from "../../../../../../api/courseApi";
import CustomButton from "../../../../../../components/Button/CustomButton";
import CustomInput from "../../../../../../components/Input/CustomInput";
import { useSnackbar } from "notistack";
import { isEmpty } from "../../../../../../components/tools/Tools";
const schema = yup.object().shape({
  content: yup.string().required("Vui lòng nhập nội dung"),
});
const useStyles = makeStyles(() => ({
  form: {
    padding: "25px",
    border: "1px solid var(--colorGray2)",
    marginTop: "39px",
    borderRadius: "7px",

    "&>div:nth-child(1)": {
      "&>div:nth-child(1)": {
        display: "flex",
        justifyContent: " space-between",
        "&>div:first-of-type": {
          display: "flex",
          alignItems: "center",
          "&>div": {
            marginRight: 20,
          },
          "&>span": {
            fontSize: 20,
            color: "var(--colorBlack2)",
          },
        },
      },

      display: "flex",
      flexFlow: "column",
    },
    "&>div:nth-child(2)": {
      marginBottom: 20,
    },
    "&>div:nth-child(3)": {
      display: "flex",
      justifyContent: "flex-end",
    },
  },
  title: {
    fontSize: "25px",
    fontWeight: "600",
    color: "var(--colorBlack1)",
    marginBottom: "20px",
  },
  iconRating: {
    fontSize: "29px",
  },
}));
function FormRating(props) {
  const { idCourse, evaluateUser = {}, onUpdate = null } = props;
  const classes = useStyles();
  const [dataUser, setDataUser] = useRecoilState(DataUser);
  const { enqueueSnackbar } = useSnackbar();
  const [deffaultStar, setDefaultStar] = useState(5);
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      content: "",
      rating: deffaultStar,
    },
    resolver: yupResolver(schema),
  });
  const handleOnSubmit = (values) => {
    console.log("Post Ratings:", values);
    if (isEmpty(evaluateUser)) {
      (async () => {
        const rp = await courseApi.postRating(idCourse, values);
        console.log(rp);
        if (!rp.status) {
          console.log(rp);
          enqueueSnackbar("Đánh giá thành công", { variant: "success" });
          form.reset();
          if (onUpdate) onUpdate();
        }
      })();
    } else {
      (async () => {
        const rp = await courseApi.postRating(idCourse, values);
        console.log(rp);
        if (!rp.status) {
          console.log(rp);
          enqueueSnackbar("Cập nhật đánh giá thành công", {
            variant: "success",
          });
          form.reset();
          if (onUpdate) onUpdate();
        }
      })();
    }
  };
  useEffect(() => {
    (() => {
      if (!isEmpty(evaluateUser)) {
        form.setValue("content", evaluateUser.content);
        setDefaultStar(evaluateUser.rating);
      }
    })();
  }, [evaluateUser]);
  // console.log(deffaultStar);
  return (
    <form className={classes.form} onSubmit={form.handleSubmit(handleOnSubmit)}>
      <div>
        <div>
          <span className={classes.title}>Form đánh giá</span>
          <div>
            <Avatar src={dataUser.user.avatar} />
            <span>{dataUser.user.username}</span>
          </div>
        </div>
        <Rating
          key={deffaultStar}
          name="rating"
          defaultValue={deffaultStar}
          className={classes.iconRating}
          onChange={(value, newValue) => {
            form.setValue("rating", newValue);
          }}
        />
      </div>
      <div>
        <CustomInput
          title="Nội dung"
          label="Nội dung"
          name="content"
          multiline={true}
          rows={5}
          form={form}
        />
      </div>
      <div>
        <CustomButton title="Gửi" type="submit" />
      </div>
    </form>
  );
}

export default FormRating;
