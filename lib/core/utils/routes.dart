import 'package:camera_tutorial/view/home/views/home_page_view.dart';
import 'package:camera_tutorial/view/second/view/second_page.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  static router_generator(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => HomePage());
      case "/second":
        return MaterialPageRoute(
          builder: (context) => SecondPage(
            image_path: args,
          ),
        );
    }
  }
}
