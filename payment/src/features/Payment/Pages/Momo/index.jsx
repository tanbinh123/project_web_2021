import PropTypes from "prop-types";
import React from "react";
import { useLocation } from "react-router-dom";

Momo.propTypes = {
    title:PropTypes.string,
};
Momo.defaultProps = {
    title:"Momo",
};

function Momo(props) {
    const {title} =props;
    document.title = title;
    const search = useLocation().search;
   const id= new URLSearchParams(search).get("id");
    
  return <div>Momo {id}</div>;
}

export default Momo;