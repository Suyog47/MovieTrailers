import 'package:flutter/material.dart';
import 'package:movie_trailers/screens/home_page.dart';
import 'package:movie_trailers/screens/information.dart';
import 'package:movie_trailers/screens/video.dart';

import 'page_transitions.dart';

class Routers{

  static Route<dynamic>? generateRoutes(RouteSettings settings){
    switch (settings.name) {

      case '/home':
        return CustomPageTransitions()
            .bottomToTopTransition(Home(), settings);
        break;

      case '/information':
        return CustomPageTransitions()
            .bottomToTopTransition(MovieInformation(), settings);
        break;

      case '/video':
        return CustomPageTransitions()
            .rightToLeftFadeTransition(Video(), settings);

      default:
        return null;
    }
  }
}