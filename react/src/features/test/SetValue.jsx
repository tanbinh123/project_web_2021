import React, { useState } from "react";
import PropTypes from "prop-types";

SetValue.propTypes = {};

function SetValue(props) {
  const [values, setValues] = useState({
    id: 1,
    value: "",
    ten: "Nguyen Huy Thanh Sang",
  });
  const handleOnChange = (e) => {
    setValues({ ...values, value: e.target.value });
  };
  const handleOnSubmit = (e) => {
    e.preventDefault();
    console.log(values);
  };
  return (
    <div>
      <form onSubmit={handleOnSubmit}>
        <input type="text" name="name" onChange={handleOnChange} />
        <button type="submit">submit</button>
      </form>
    </div>
  );
}

export default SetValue;
