import { signup, login, logout } from "../util/session_api_util";

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";

export const receiveCurrentUser = user => ({
  type: RECEIVE_CURRENT_USER,
  user
});

export const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const loginUser = userForm => dispatch =>
  login(userForm).then(
    user => dispatch(receiveCurrentUser(user)),
    errors => dispatch(receiveErrors(errors))
  );

export const signupUser = userForm => dispatch =>
  signup(userForm).then(
    user => dispatch(receiveCurrentUser(user)),
    errors => dispatch(receiveErrors(errors))
  );

export const logoutUser = () => dispatch =>
  logout().then(
    () => dispatch(receiveCurrentUser({ currentUser: null })),
    errors => dispatch(receiveErrors(errors))
  );
