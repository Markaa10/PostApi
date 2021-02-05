import 'package:architecture_state_managemet/core/enums/viewstate.dart';
import 'package:architecture_state_managemet/core/models/post.dart';
import 'package:architecture_state_managemet/core/models/user.dart';
import 'package:architecture_state_managemet/core/viewmodels/home_model.dart';
import 'package:architecture_state_managemet/ui/shared/app_colors.dart';
import 'package:architecture_state_managemet/ui/shared/text_styles.dart';
import 'package:architecture_state_managemet/ui/shared/ui_helpers.dart';
import 'package:architecture_state_managemet/ui/views/base_view.dart';
import 'package:architecture_state_managemet/ui/widgets/postlist_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      'Welcome ${Provider.of<User>(context).name}',
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      'Here are all your posts',
                      style: subHeaderStyle,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(child: getPostsUi(model.posts)),
                ],
              ),
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, '/post', arguments: posts[index]);
          },
        ),
      );
}
