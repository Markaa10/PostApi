import 'package:architecture_state_managemet/core/models/post.dart';
import 'package:architecture_state_managemet/ui/views/home_view.dart';
import 'package:architecture_state_managemet/ui/views/login_view.dart';
import 'package:architecture_state_managemet/ui/views/post_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(
            builder: (_) => PostView(
                  post: post,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
