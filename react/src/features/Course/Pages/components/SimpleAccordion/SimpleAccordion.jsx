import { makeStyles } from '@material-ui/core/styles';
import React, { useState } from 'react';
import ItemAccordion from './ItemAccordion';

const useStyles = makeStyles((theme) => ({
  root: {
    width: '100%',
    marginTop: 30,
  },
}));

export default function SimpleAccordion(props) {
  const { parts, isFull = false } = props;
  let indexLecture = 0;
  const classes = useStyles();
  return (
    <div className={classes.root}>
      {Array.from(parts || []).map((item, index) => (
        <ItemAccordion
          key={item.id + ''}
          title={index + 1 + ': ' + item.title}
          isFull={isFull}
          indexLecture={
            index == 0
              ? indexLecture
              : (indexLecture += parts[index - 1].lessons.length)
          }
          lessons={item.lessons}
        />
      ))}
    </div>
  );
}
