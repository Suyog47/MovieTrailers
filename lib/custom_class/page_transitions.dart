import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CustomPageTransitions {
  PageTransition bottomToTopTransition(Widget page, RouteSettings settings) {
    return PageTransition(
        child: page,
        type: PageTransitionType.bottomToTop,
        duration: Duration(milliseconds: 300),
        settings: settings);
  }

  PageTransition rightToLeftFadeTransition(
      Widget page, RouteSettings settings) {
    return PageTransition(
        child: page,
        type: PageTransitionType.rightToLeftWithFade,
        duration: Duration(milliseconds: 600),
        reverseDuration: Duration(milliseconds: 600),
        settings: settings,
        alignment: Alignment.center);
  }

}