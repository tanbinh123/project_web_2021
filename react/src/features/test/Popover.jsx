import React from "react";
import Typography from "@material-ui/core/Typography";
import Box from "@material-ui/core/Box";
import Button from "@material-ui/core/Button";
import Popover from "@material-ui/core/Popover";
import PopupState, { bindTrigger, bindPopover } from "material-ui-popup-state";
import { Divider, List, ListItem, ListItemText } from "@material-ui/core";
import { usePopupState } from "material-ui-popup-state/hooks";
export default function PopoverPopupState(props) {
  const { title } = props;
  const popupState = usePopupState({
    variant: "popover",
    popupId: "demoPopover",
  });
  return (
    <div>
      <Button variant="contained" {...bindTrigger(popupState)}>
        {title}
      </Button>
      <Popover
        {...bindPopover(popupState)}
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "center",
        }}
        transformOrigin={{
          vertical: "top",
          horizontal: "center",
        }}
      >
        <Box p={1}>
          <List component="nav" aria-label="mailbox folders">
            <ListItem button onClick={popupState.close}>
              <ListItemText primary="Inbox" />
            </ListItem>
            <Divider />
            <ListItem button divider>
              <ListItemText primary="Drafts" />
            </ListItem>
            <ListItem button>
              <ListItemText primary="Trash" />
            </ListItem>
            <Divider light />
            <ListItem button>
              <ListItemText primary="Spam" />
            </ListItem>
          </List>
        </Box>
      </Popover>
    </div>
  );
}
