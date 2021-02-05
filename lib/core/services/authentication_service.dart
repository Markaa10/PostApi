import 'dart:async';

import 'package:architecture_state_managemet/core/models/user.dart';
import 'package:architecture_state_managemet/core/services/api.dart';
import 'package:architecture_state_managemet/locator.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;

    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}
