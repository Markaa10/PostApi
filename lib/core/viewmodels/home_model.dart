import 'package:architecture_state_managemet/core/enums/viewstate.dart';
import 'package:architecture_state_managemet/core/models/post.dart';
import 'package:architecture_state_managemet/core/services/api.dart';
import 'package:architecture_state_managemet/core/viewmodels/base_model.dart';
import 'package:architecture_state_managemet/locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
