import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_demo/models/app_state.dart';
import 'package:redux_demo/models/user/user_model.dart';
import 'package:redux_demo/ui/screen/user_details/widget/user_details_props.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserDetailsScreenProps>(
        converter: (store) => mapStateToProps(store),
        builder: (context, props) {
          UserDetails? data = props.detailsResponse!.data;
          bool? loading = props.detailsResponse!.loading;

          TextStyle textStyle = const TextStyle(height: 2, fontSize: 20);
          Widget body;
          if (loading!) {
            body = const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            body = Center(
              child: IntrinsicWidth(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data!.name!,
                      style: textStyle,
                    ),
                    Text(
                      data.email!,
                      style: textStyle,
                    ),
                    Text(
                      data.website!,
                      style: textStyle,
                    )
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: body,
          );
        });
  }
}
