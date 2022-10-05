import 'dart:convert';

import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:redux_demo/action/user_action.dart';
import 'package:redux_demo/models/user/user_model.dart';
import 'package:redux_demo/models/user/user_state.dart';

UserState userReducer(UserState state, FSA action) {
  UserState newState = state;

  switch (action.type) {
    case LIST_USERS_REQUEST:
      newState.list!.error = null;
      newState.list!.loading = true;
      newState.list!.data = null;
      return newState;

    case LIST_USERS_SUCCESS:
      newState.list!.error = null;
      newState.list!.loading = false;
      newState.list!.data = usersFromJSONStr(action.payload);
      return newState;

    case LIST_USERS_FAILURE:
      newState.list!.error = action.payload;
      newState.list!.loading = false;
      newState.list!.data = null;
      return newState;

    case LIST_USERS_DETAILS_REQUEST:
      newState.details!.error = null;
      newState.details!.loading = true;
      newState.details!.data = null;
      return newState;

    case LIST_USERS_DETAILS_SUCCESS:
      newState.details!.error = null;
      newState.details!.loading = false;
      newState.details!.data = userFromJSONStr(action.payload);
      return newState;

    case LIST_USERS_DETAILS_FAILURE:
      newState.details!.error = action.payload;
      newState.details!.loading = false;
      newState.details!.data = null;
      return newState;

    default:
      return newState;
  }
}

List<User> usersFromJSONStr(dynamic payload) {
  Iterable jsonArray = json.decode(payload);
  return jsonArray.map((e) => User.fromJson(e)).toList();
}

UserDetails userFromJSONStr(dynamic payload) {
  return UserDetails.fromJson(json.decode(payload));
}
