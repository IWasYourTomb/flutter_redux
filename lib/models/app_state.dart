import 'package:flutter/material.dart';

import 'user/user_state.dart';

@immutable
class AppState {
  final UserState? user;

  const AppState({this.user});

  factory AppState.initial() => AppState(user: UserState.initial());

  AppState copyWith({UserState? user}) => AppState(user: user ?? this.user);
}
