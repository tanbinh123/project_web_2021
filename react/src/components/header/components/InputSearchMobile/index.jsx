import Autocomplete, {
  createFilterOptions,
} from '@material-ui/lab/Autocomplete';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router';
import courseApi from '../../../../api/courseApi';
import courseApiFake from '../../../../api/courseApiFake';
import TextFieldSearchMobile from '../../../TextField/TextFieldSearchMobile';

const filter = createFilterOptions({
  limit: 7,
});

InputSearchAppbarMobile.propTypes = {};

function InputSearchAppbarMobile({ openSearch }) {
  const [value] = useState(null);
  // const [value, setValue] = useState(null);
  const [dataSearch, setDataSearch] = useState([]);
  const { push } = useHistory();
  const [paramsSearch, setParamsSearch] = useState({
    _search: '',
  });
  useEffect(() => {
    (async () => {
      const { data } = await courseApi.getAll(paramsSearch);
      setDataSearch(data);
    })();
    return () => {
      setDataSearch([]);
    };
  }, [paramsSearch]);
  const handleOnChange = (value) => {
    setParamsSearch((pre) => ({
      ...pre,
      _search: value,
    }));
  };

  const handleOnpenSearch = () => {
    if (openSearch) openSearch();
  };

  return (
    <Autocomplete
      value={value}
      onChange={(event, newValue) => {
        // console.log(newValue);
        if (!!newValue.id) {
          push(`/course/${newValue.id}`);
        } else {
          push(`/course?_search=${newValue.inputValue || newValue}`);
        }
      }}
      filterOptions={(options, params) => {
        const filtered = filter(options, params);
        // Suggest the creation of a new value
        if (params.inputValue !== '') {
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
        if (typeof option === 'string') {
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
        <TextFieldSearchMobile
          onChange={handleOnChange}
          params={params}
          openSearch={handleOnpenSearch}
        />
      )}
    />
  );
}

export default InputSearchAppbarMobile;
