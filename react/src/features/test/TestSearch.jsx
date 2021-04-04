import React, { useEffect, useState } from "react";
import TextField from "@material-ui/core/TextField";
import Autocomplete, {
  createFilterOptions,
} from "@material-ui/lab/Autocomplete";
import courseApiFake from "../../api/courseApiFake";
import { useHistory } from "react-router";

const filter = createFilterOptions({
  limit: 7,
});

export default function FreeSoloCreateOption() {
  const [value, setValue] = React.useState(null);
  const [dataSearch, setDataSearch] = useState([]);
  const { push } = useHistory();
  const [paramsSearch, setParamsSearch] = useState({
    q: "wqeuyiwqyuhsdpjsapijdaspdnmasncixozpnc",
  });
  useEffect(() => {
    (async () => {
      const { data } = await courseApiFake.search(paramsSearch);
      setDataSearch(data);
    })();
  }, [paramsSearch]);
  const handleOnChange = (e) => {
    console.log(e.target.value);
    setParamsSearch((pre) => ({
      ...pre,
      q: e.target.value,
    }));
  };
  return (
    <Autocomplete
      value={value}
      onChange={(event, newValue) => {
        if (!!newValue.id) {
          push(`/course?id=${newValue.id}`);
        } else {
          push(`/course?q=${newValue.inputValue}`);
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
      id="free-solo-with-text-demo"
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
      style={{ width: 300 }}
      freeSolo
      renderInput={(params) => (
        <TextField {...params} onChange={handleOnChange} variant="outlined" />
      )}
    />
  );
}
