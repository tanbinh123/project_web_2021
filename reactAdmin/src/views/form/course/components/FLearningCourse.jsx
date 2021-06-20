import { CCard, CCardBody, CCardFooter, CCardHeader } from "@coreui/react";
import { yupResolver } from "@hookform/resolvers/yup";
import { makeStyles } from "@material-ui/core";
import React, { useEffect, useState } from "react";
import { useForm } from "react-hook-form";
import CustomButton from "src/components/CustomButton";
import CustomButtonRed from "src/components/CustomButtonRed";
import CustomInput from "src/components/CustomInput";
import courseApi from "src/api/courseApi";
import * as yup from "yup";
import { useSnackbar } from "notistack";
import classNames from "classnames";
const useStyles = makeStyles((theme) => ({
  form: {
    "& > div": {
      display: "flex",
      alignItems: "center",
      "& > span": {
        minWidth: "150px",
        fontSize: " 16px",
      },
      marginBottom: "30px",
      "&>button": {
        marginLeft: "15px",
      },
    },
    "& > div:last-of-type": {
      display: "flex",
      alignItems: "center",
      justifyContent: "center",
    },
  },
  footer: {
    display: "flex",
    justifyContent: "space-between",
  },
  visiable: {
    visibility: "hidden",
  },
  [theme.breakpoints.down("md")]: {
    form: {
      "& > div": {
        display: "flex",
        flexFlow: "column",
        alignItems: "start",
        "& > span": {
          marginBottom: "15px",
        },
        "&>button": {
          marginLeft: "0px",
          marginTop: "10px",
        },
      },
      "& > div:last-of-type": {},
    },
  },
}));
const schema = yup.object().shape({
  // firstName: yup.string().required(),
});
function FLearningCourse(props) {
  const classes = useStyles();
  const { enqueueSnackbar } = useSnackbar();
  const {
    nextCurrentStep = null,
    step = 0,
    currentStep = 0,
    prevStep = null,
    nextStep = null,
    dataCourse = {},
    updateCourse = null,
  } = props;
  const [dataLearning, setDataLearning] = useState(dataCourse.learnings || []);
  const [isUpdate, setUpdate] = useState(false);
  // console.log(dataLearning);
  const form = useForm({
    mode: "onBlur",
    defaultValues: {
      data: [],
    },
    resolver: yupResolver(schema),
  });
  useEffect(() => {
    // console.log("useEffect");
    Array.from(dataLearning).map((item, index) => {
      form.setValue(`data[${index}]`, item);
    });
    return () => {
      form.setValue(`data`, []);
    };
  }, [dataLearning, isUpdate]);
  const handleOnSubmit = async (values) => {
    console.log("Learnings Post", values);

    if (nextCurrentStep) nextCurrentStep(3);
    const rp = await courseApi.postLearnings(dataCourse.id, values.data);
    if (!rp.status) {
      console.log(rp);
      if (updateCourse) updateCourse(rp);
      enqueueSnackbar("Cập nhật thành công", { variant: "success" });
      setDataLearning(rp.learnings);
    } else {
      enqueueSnackbar("Cập nhật không thành công", { variant: "error" });
    }
  };
  return (
    <CCard>
      <CCardHeader>
        <span className="title">Form: Sẽ học được gì</span>
      </CCardHeader>
      <CCardBody>
        <form
          className={classes.form}
          onSubmit={form.handleSubmit(handleOnSubmit)}
        >
          {Array.from(dataLearning).map(
            (item, index) =>
              !item.deleted && (
                <div key={index}>
                  <span>Học được {index + 1}</span>
                  <CustomInput
                    name={`data[${index}].learning`}
                    title={`Học được ${index + 1}`}
                    label={`Học được ${index + 1}`}
                    form={form}
                  />
                  <CustomButtonRed
                    title="Delete"
                    onClick={() => {
                      const tmpData = form.getValues("data");
                      // console.log(tmpData);
                      if (item.id) {
                        tmpData[index].deleted = true;
                        setDataLearning(tmpData);
                        setUpdate(!isUpdate);
                      } else {
                        tmpData.splice(index, 1);
                        form.reset({ courseId: dataCourse.id, data: [] });
                        // let tmpData12 = form.getValues("data");
                        form.setValue("data", tmpData);
                        // console.log(tmpData12);
                        setDataLearning(tmpData);
                        setUpdate(!isUpdate);
                      }
                    }}
                  />
                </div>
              )
          )}
          <div>
            <CustomButton
              title="Thêm"
              onClick={() => {
                const tmpData = form.getValues("data");
                // console.log(tmpData);
                setDataLearning([
                  ...tmpData,
                  {
                    deleted: false,
                    learning: "",
                  },
                ]);
                setUpdate(!isUpdate);
              }}
            />
          </div>
          <div>
            <CustomButton type="submit" title="Gửi" />
          </div>
        </form>
      </CCardBody>
      <CCardFooter className={classes.footer}>
        <div className={classNames(step <= 0 && classes.visiable)}>
          <CustomButton
            title="Trước"
            onClick={() => {
              if (prevStep) prevStep();
            }}
          />
        </div>
        <div className={classNames(step >= currentStep && classes.visiable)}>
          <CustomButton
            title="Sau"
            onClick={() => {
              if (nextStep) nextStep();
            }}
          />
        </div>
      </CCardFooter>
    </CCard>
  );
}

export default FLearningCourse;
