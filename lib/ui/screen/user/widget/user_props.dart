import 'package:redux/redux.dart';
import 'package:redux_demo/action/user_action.dart';
import 'package:redux_demo/models/app_state.dart';
import 'package:redux_demo/models/user/user_state.dart';

class UsersScreenProps {
  final Function getUsers;
  final Function getUserDetails;
  final ListUserState listResponse;

  UsersScreenProps({
    required this.getUsers,
    required this.listResponse,
    required this.getUserDetails,
  });
}

UsersScreenProps mapStateToProps(Store<AppState> store) {
  return UsersScreenProps(
    listResponse: store.state.user!.list!,
    getUsers: () => store.dispatch(getUser()),
    getUserDetails: (int id) => store.dispatch(getUserDetails(id)),
  );
}
