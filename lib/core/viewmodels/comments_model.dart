import 'package:architecture_state_managemet/core/enums/viewstate.dart';
import 'package:architecture_state_managemet/core/models/comment.dart';
import 'package:architecture_state_managemet/core/services/api.dart';
import 'package:architecture_state_managemet/core/viewmodels/base_model.dart';
import 'package:architecture_state_managemet/locator.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
