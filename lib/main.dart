import 'package:architecture_state_managemet/core/models/user.dart';
import 'package:architecture_state_managemet/core/services/authentication_service.dart';
import 'package:architecture_state_managemet/locator.dart';
import 'package:architecture_state_managemet/ui/router.dart' as router;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/views/login_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: '/login',
        onGenerateRoute: router.Router.generateRoute,
      ),
    );
  }
}
