import React from "react";
import PropTypes from "prop-types";
import { useParams } from "react-router";

CourseDetail.propTypes = {};

function CourseDetail(props) {
  const id = useParams();
  console.log(id);
  const {} = props;
  return <div></div>;
}

export default CourseDetail;
