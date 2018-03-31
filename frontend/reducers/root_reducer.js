import { combineReducer } from "redux";
import sessionReducer from "./session_reducer";
import errorsReducer from "./errors_reducer";

const rootReducer = combineReducer({
  session: sessionReducer,
  errors: errorsReducer
});
