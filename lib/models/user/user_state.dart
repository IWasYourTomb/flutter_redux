import 'package:redux_demo/models/user/user_model.dart';

class UserState {
  ListUserState? list;
  UserDetailsState? details;

  UserState({this.list, this.details});

  factory UserState.initial() => UserState(
      list: ListUserState.initial(), details: UserDetailsState.initial());
}

class ListUserState {
  dynamic error;
  bool? loading;
  List<User>? data;

  ListUserState({this.data, this.error, this.loading});

  factory ListUserState.initial() =>
      ListUserState(error: null, loading: false, data: []);
}

class UserDetailsState {
  dynamic error;
  bool? loading;
  UserDetails? data;

  UserDetailsState({this.data, this.error, this.loading});

  factory UserDetailsState.initial() =>
      UserDetailsState(error: null, loading: false, data: null);
}
