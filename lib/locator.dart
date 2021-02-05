import 'package:architecture_state_managemet/core/services/api.dart';
import 'package:architecture_state_managemet/core/services/authentication_service.dart';
import 'package:architecture_state_managemet/core/viewmodels/comments_model.dart';
import 'package:architecture_state_managemet/core/viewmodels/home_model.dart';
import 'package:architecture_state_managemet/core/viewmodels/login_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}
