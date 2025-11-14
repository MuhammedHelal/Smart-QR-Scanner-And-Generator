import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

void navigateWithoutNavBar(BuildContext context, Widget widget) async {
  await PersistentNavBarNavigator.pushNewScreen(
    context,
    screen: widget,
    withNavBar: false,
    pageTransitionAnimation: PageTransitionAnimation.slideRight,
  );
}

void navigateWithoutNavBarWithCupertinoAnimation(
    BuildContext context, Widget widget) async {
  await PersistentNavBarNavigator.pushNewScreen(
    context,
    screen: widget,
    withNavBar: false,
    pageTransitionAnimation: PageTransitionAnimation.cupertino,
  );
}
