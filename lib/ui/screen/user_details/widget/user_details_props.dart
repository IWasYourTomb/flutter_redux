import 'package:redux/redux.dart';
import 'package:redux_demo/models/user/user_state.dart';

import '../../../../models/app_state.dart';

class UserDetailsScreenProps {
  final UserDetailsState? detailsResponse;

  UserDetailsScreenProps({
    this.detailsResponse,
  });
}

UserDetailsScreenProps mapStateToProps(Store<AppState> store) {
  return UserDetailsScreenProps(
    detailsResponse: store.state.user!.details,
  );
}
