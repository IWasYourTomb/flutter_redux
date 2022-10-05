import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_demo/models/app_state.dart';
import 'package:redux_demo/models/user/user_model.dart';
import 'package:redux_demo/ui/screen/user/widget/user_props.dart';
import 'package:redux_demo/untils/routes.dart';

class UsersScreen extends StatelessWidget {
  void handleInitialBuild(UsersScreenProps props) {
    props.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UsersScreenProps>(
      converter: (store) => mapStateToProps(store),
      onInitialBuild: (props) => handleInitialBuild(props),
      builder: (context, props) {
        List<User> data = props.listResponse.data!;
        bool loading = props.listResponse.loading!;

        Widget body;
        if (loading) {
          body = const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          body = ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: data.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, i) {
              User user = data[i];

              return ListTile(
                title: Text(
                  user.name!,
                ),
                onTap: () {
                  props.getUserDetails(user.id);
                  Navigator.pushNamed(context, AppRoutes.userDetails);
                },
              );
            },
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Users list'),
          ),
          body: body,
        );
      },
    );
  }
}
