import Autocomplete, {
  createFilterOptions,
} from "@material-ui/lab/Autocomplete";
import React, { useEffect, useState } from "react";
import { useHistory } from "react-router";
import courseApiFake from "../../../../api/courseApiFake";
import InputSearch from "../../../TextField/InputSearch";

const filter = createFilterOptions({
  limit: 7,
});

InputSearchAppbar.propTypes = {};

function InputSearchAppbar({ openSearch }) {
  const [value] = useState(null);
  // const [value, setValue] = React.useState(null);
  const [dataSearch, setDataSearch] = useState([]);
  const { push } = useHistory();
  const [paramsSearch, setParamsSearch] = useState({
    q: "",
  });
  useEffect(() => {
    (async () => {
      const { data } = await courseApiFake.search(paramsSearch);
      setDataSearch(data);
    })();
    return () => {
      setDataSearch([]);
    };
  }, [paramsSearch]);
  const handleOnChange = (value) => {
    setParamsSearch((pre) => ({
      ...pre,
      q: value,
    }));
  };

  const handleOnpenSearch = () => {
    if (openSearch) openSearch();
  };

  return (
    <Autocomplete
      value={value}
      onChange={(event, newValue) => {
        console.log(newValue);
        if (!!newValue.id) {
          push(`/course/${newValue.id}`);
        } else {
          push(`/course?q=${newValue.inputValue || newValue}`);
        }
      }}
      filterOptions={(options, params) => {
        const filtered = filter(options, params);
        // Suggest the creation of a new value
        if (params.inputValue !== "") {
          filtered.push({
            inputValue: params.inputValue,
            title: `Search "${params.inputValue}"`,
          });
        }
        return filtered;
      }}
      //   selectOnFocus
      //   clearOnBlur
      handleHomeEndKeys
      options={dataSearch}
      getOptionLabel={(option) => {
        // Value selected with enter, right from the input
        if (typeof option === "string") {
          return option;
        }
        // Add "xxx" option created dynamically
        if (option.inputValue) {
          return option.inputValue;
        }
        // Regular option
        return option.title;
      }}
      renderOption={(option) => option.title}
      freeSolo
      renderInput={(params) => (
        <InputSearch
          onChange={handleOnChange}
          params={params}
          openSearch={handleOnpenSearch}
        />
      )}
    />
  );
}

export default InputSearchAppbar;
