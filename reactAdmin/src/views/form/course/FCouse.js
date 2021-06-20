import { Grid, makeStyles } from "@material-ui/core";
import React, { useState } from "react";
import FBaseCourse from "./components/FBaseCourse";
import FDemoCourse from "./components/FDemoCourse";
import FLearningCourse from "./components/FLearningCourse";
import FPartCourse from "./components/FPartCourse";

const FCourse = () => {
  const classes = makeStyles(() => ({
    footer: {
      display: "flex",
      justifyContent: "space-between",
    },
    visiable: {
      visibility: "hidden",
    },
  }))();
  const [dataCourse, setDataCourse] = useState({});
  const changeDataCourse = (value) => {
    setDataCourse(value);
  };
  const [step, setStep] = useState(0);
  const [currentStep, setCurrentStep] = useState(0);
  const handleNextStep = () => {
    setStep(step + 1);
  };
  const handleIncreaseCurrentStep = (value) => {
    setStep(step + 1);
    setCurrentStep(value || currentStep + 1);
  };
  const handlePrevStep = () => {
    setStep(step - 1);
  };
  console.log(step);
  console.log("currentStep", currentStep);
  // step={step}
  // prevStep={handlePrevStep}
  // nextStep={handleNextStep}
  const handleUpdateCourse = (values) => {
    setDataCourse(values);
  };
  return (
    <>
      <Grid container className="root" spacing={3}>
        <Grid item xl={12} lg={12} md={12} xs={12} sm={12}>
          {step === 0 && (
            <FBaseCourse
              nextCurrentStep={handleIncreaseCurrentStep}
              step={step}
              currentStep={currentStep}
              prevStep={handlePrevStep}
              nextStep={handleNextStep}
              dataCourse={dataCourse}
              updateCourse={handleUpdateCourse}
            />
          )}
          {step === 1 && (
            <FDemoCourse
              nextCurrentStep={handleIncreaseCurrentStep}
              step={step}
              currentStep={currentStep}
              prevStep={handlePrevStep}
              nextStep={handleNextStep}
              dataCourse={dataCourse}
              updateCourse={handleUpdateCourse}
            />
          )}
          {step === 2 && (
            <FLearningCourse
              nextCurrentStep={handleIncreaseCurrentStep}
              step={step}
              currentStep={currentStep}
              prevStep={handlePrevStep}
              nextStep={handleNextStep}
              dataCourse={dataCourse}
              updateCourse={handleUpdateCourse}
            />
          )}
          {step === 3 && (
            <FPartCourse
              nextCurrentStep={handleIncreaseCurrentStep}
              step={step}
              currentStep={currentStep}
              prevStep={handlePrevStep}
              nextStep={handleNextStep}
              dataCourse={dataCourse}
              updateCourse={handleUpdateCourse}
            />
          )}
        </Grid>
      </Grid>
    </>
  );
};

export default FCourse;
