import React from "react";
import PropTypes from "prop-types";
import { useParams } from "react-router";

Lecture.propTypes = {};

function Lecture(props) {
  const { idLecture } = useParams();
  console.log(idLecture);
  return (
    <div>
      <h1>{idLecture}</h1>
    </div>
  );
}

export default Lecture;
