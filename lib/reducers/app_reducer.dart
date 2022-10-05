import 'package:redux_demo/models/app_state.dart';
import 'package:redux_demo/reducers/user_reducer.dart';

AppState appReducer(AppState state, action) =>
    AppState(user: userReducer(state.user!, action));
