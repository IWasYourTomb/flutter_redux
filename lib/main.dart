import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_api_middleware/redux_api_middleware.dart';
import 'package:redux_demo/models/app_state.dart';
import 'package:redux_demo/reducers/app_reducer.dart';
import 'package:redux_demo/ui/screen/user/user_screen.dart';
import 'package:redux_demo/ui/screen/user_details/user_details_screen.dart';
import 'package:redux_demo/untils/logger.dart';
import 'package:redux_demo/untils/routes.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store<AppState>(appReducer,
      initialState: AppState.initial(),
      middleware: [thunkMiddleware, apiMiddleware, loggingMiddleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        routes: {
          AppRoutes.users: (context) => UsersScreen(),
          AppRoutes.userDetails: (context) => UserDetailsScreen()
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
