import { RECEIVE_CURRENT_USER } from "../actions/session_actions";

const _nullState = {
  currentUser: null
};

export default (state = _nullState, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return action.user;
    default:
      return state;
  }
};
