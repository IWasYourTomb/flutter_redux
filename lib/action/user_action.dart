import 'package:redux/redux.dart';
import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:redux_demo/models/app_state.dart';
import 'package:redux_thunk/redux_thunk.dart';

const LIST_USERS_REQUEST = 'LIST_USERS_REQUEST';
const LIST_USERS_SUCCESS = 'LIST_USERS_SUCCESS';
const LIST_USERS_FAILURE = 'LIST_USERS_FAILURE';

RSAA getUserRequest() {
  return RSAA(
      endpoint: 'http://jsonplaceholder.typicode.com/users',
      method: 'GET',
      types: [LIST_USERS_REQUEST, LIST_USERS_SUCCESS, LIST_USERS_FAILURE],
      headers: {'Content-Type': 'application/json'});
}

ThunkAction<AppState> getUser() =>
    (Store<AppState> store) => store.dispatch(getUserRequest());

const LIST_USERS_DETAILS_REQUEST = 'LIST_USERS_DETAILS_REQUEST';
const LIST_USERS_DETAILS_SUCCESS = 'LIST_USERS_DETAILS_SUCCESS';
const LIST_USERS_DETAILS_FAILURE = 'LIST_USERS_DETAILS_FAILURE';

RSAA getUserDetailsRequest(int id) {
  return RSAA(
      endpoint: 'http://jsonplaceholder.typicode.com/users/$id',
      method: 'GET',
      types: [
        LIST_USERS_DETAILS_REQUEST,
        LIST_USERS_DETAILS_SUCCESS,
        LIST_USERS_DETAILS_FAILURE
      ],
      headers: {
        'Content-Type': 'application/json'
      });
}

ThunkAction<AppState> getUserDetails(int id) =>
    (Store<AppState> store) => store.dispatch(getUserDetailsRequest(id));
